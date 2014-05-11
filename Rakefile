require 'pdfkit'

PDFKit.configure do |config|
  config.default_options = {
    :margin_top => '0in',
    :margin_right => '0.75in',
    :margin_bottom => '0.75in',
    :margin_left => '0.75in',
    :print_media_type => false
  }
end

desc "Build the website from source"
task :build do
  puts "## Building website"
  status = system("middleman build --clean")
  puts status ? "Build Success" : "Build FAILED"

  # Build Resume PDF
  resume_html = File.read("build/resume/index.html")
  kit = PDFKit.new(resume_html, :page_size => 'Letter')
  kit.stylesheets << 'build/assets/stylesheets/all.css'
  kit.stylesheets << 'source/assets/stylesheets/resume-print.css'
  file = kit.to_file('build/assets/resume.pdf')
end

desc "Deploy website via rsync"
task :deploy do
  puts "## Deploying website via middleman s3_sync"
  status = system("middleman s3_sync")
  puts status ? "OK" : "FAILED"
end

desc "Build and deploy website"
task :build_deploy => [:build, :deploy] do
end
