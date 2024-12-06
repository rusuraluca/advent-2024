# **Image Resizer**

A high-performance Rust application for resizing images in bulk, demonstrating Rust's speed and efficiency. This app processes images with customizable dimensions and filter options, making it ideal for quick batch resizing.

---

## **Features**
- **Batch Image Resizing:** Resize all images in the specified input directory to the desired dimensions.
- **Custom Filters:** Choose from various resizing filters for quality and speed optimization:
  - **Nearest**
  - **Triangle**
  - **CatmullRom**
  - **Gaussian**
  - **Lanczos3**
- **Error Handling:** Handles invalid paths and read-only filesystems gracefully.
- **Multithreading:** Leverages Rust's rayon library for parallel processing to maximize performance.
---

## **Technologies Used**
- **Rust**
- **Cargo**: Rust's build and package manager.
- **Image Crate**: For image processing.
- **Clap Crate**: For command-line argument parsing.
- **Rayon Crate**: For multithreaded processing.

---

## **Setup Instructions**

### **Prerequisites**
- Rust installed on your system.

### **Clone the Repository**
```bash
git clone https://github.com/rusuraluca/advent-2024
cd day6
```

### **Build the Project**
Compile the Rust project using Cargo:
```bash
cargo build --release
```

### **Run the Application**
Run the application with the required parameters:
```bash
cargo run --release -- --input <input_directory> --output <output_directory> --width <width> --height <height> --filter <filter_type>
```

### **Example**
```bash
cargo run --release -- --input images --output output --width 800 --height 600 --filter lanczos3
```

### **Arguments**
- `--input`: Path to the directory containing input images.
- `--output`: Path to the directory for resized images.
- `--width`: Desired width of resized images.
- `--height`: Desired height of resized images.
- `--filter`: Resizing filter to use (`nearest, triangle, catmullrom, gaussian, lanczos3`).

The resized images will be saved in the specified output directory with the same filenames.