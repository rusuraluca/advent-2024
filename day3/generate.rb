require 'erb'
require 'kramdown'
require 'yaml'

POSTS_DIR = 'posts'
TEMPLATE = 'templates/layout.html.erb'
OUTPUT_DIR = 'public'

def render_template(title, content)
  template = ERB.new(File.read(TEMPLATE))
  template.result_with_hash(title: title, content: content)
end

def generate_post(file)
  markdown = File.read("#{POSTS_DIR}/#{file}")
  html_content = Kramdown::Document.new(markdown).to_html
  title = markdown.match(/^#\s+(.*)$/)[1]

  rendered_html = render_template(title, html_content)
  File.write("#{OUTPUT_DIR}/#{File.basename(file, '.md')}.html", rendered_html)
end

def generate_index
  posts = Dir.children(POSTS_DIR).select { |file| file.end_with?('.md') }
  links = posts.map do |post|
    title = File.read("#{POSTS_DIR}/#{post}").match(/^#\s+(.*)$/)[1]
    "<li><a href=\"#{File.basename(post, '.md')}.html\">#{title}</a></li>"
  end.join("\n")

  index_content = "<h2>Recent Posts</h2><ul>#{links}</ul>"
  rendered_html = render_template('Home', index_content)
  File.write("#{OUTPUT_DIR}/index.html", rendered_html)
end

def main
  Dir.mkdir(OUTPUT_DIR) unless Dir.exist?(OUTPUT_DIR)
  Dir.children(POSTS_DIR).each { |file| generate_post(file) if file.end_with?('.md') }
  generate_index
end

main
