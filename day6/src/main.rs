use clap::{Parser, ValueEnum};
use image::{imageops::FilterType, DynamicImage, GenericImageView};
use rayon::prelude::*;
use std::fs;
use std::path::{Path, PathBuf};

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
struct Cli {
    #[arg(short, long)]
    input: PathBuf,

    #[arg(short, long)]
    output: PathBuf,

    #[arg(short, long)]
    width: u32,

    #[arg(long)]
    height: u32,

    #[arg(short, long, value_enum, default_value = "lanczos3")]
    filter: ResizeFilter,
}

#[derive(ValueEnum, Clone)]
enum ResizeFilter {
    Nearest,
    Triangle,
    CatmullRom,
    Gaussian,
    Lanczos3,
}

impl From<&ResizeFilter> for FilterType {
    fn from(filter: &ResizeFilter) -> Self {
        match filter {
            ResizeFilter::Nearest => FilterType::Nearest,
            ResizeFilter::Triangle => FilterType::Triangle,
            ResizeFilter::CatmullRom => FilterType::CatmullRom,
            ResizeFilter::Gaussian => FilterType::Gaussian,
            ResizeFilter::Lanczos3 => FilterType::Lanczos3,
        }
    }
}

fn main() {
    let args = Cli::parse();

    fs::create_dir_all(&args.output).expect("Failed to create output directory");

    let images: Vec<_> = fs::read_dir(&args.input)
        .expect("Failed to read input directory")
        .filter_map(|entry| entry.ok())
        .map(|entry| entry.path())
        .filter(|path| path.is_file())
        .collect();

    images.par_iter().for_each(|image_path| {
        if let Err(e) = resize_image(
            &image_path,
            &args.output,
            args.width,
            args.height,
            &FilterType::from(&args.filter),
        ) {
            eprintln!("Failed to process {:?}: {}", image_path, e);
        }
    });

    println!("Resizing completed!");
}

fn resize_image(
    input: &Path,
    output_dir: &Path,
    width: u32,
    height: u32,
    filter: &FilterType,
) -> Result<(), Box<dyn std::error::Error>> {
    let img = image::open(input)?;
    let resized = img.resize_exact(width, height, *filter);

    let output_path = output_dir.join(input.file_name().unwrap());
    resized.save(output_path)?;

    Ok(())
}
