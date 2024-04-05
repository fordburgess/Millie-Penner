require 'mini_magick'
require 'open-uri'

class PdfToImageConverter

    def initialize(pdf_url, zine)
        @pdf_url = pdf_url
        @zine = zine
    end

    def convert_to_images
        images = []
        temp_pdf_path = download_from_cloudinary
        
        pdf = MiniMagick::Image.open temp_pdf_path

        pdf.pages.each_with_index do |page, index|            
            image_path = "page_#{(index+1).to_s}"
            converted_file_path = File.join(Dir.tmpdir, "#{image_path}-#{Time.now.strftime("%Y%m%d")}-#{$$}-#{rand(0x100000000).to_s(36)}-.png")

            MiniMagick::Tool::Convert.new do |convert|
                convert.background "white"
                convert.flatten
                convert.density 150
                convert.quality 100
                convert << page.path
                convert << converted_file_path
            end            
            @zine.pdf_images.attach(io: File.open(converted_file_path), filename: image_path, content_type: "image/png")
            FileUtils.rm(converted_file_path)
        end        
    end

    private

    def download_from_cloudinary
        temp_pdf_path = Rails.root.join('tmp', "temp_pdf_#{SecureRandom.hex(4)}.pdf")
        IO.copy_stream(URI.open(@pdf_url), temp_pdf_path)
        temp_pdf_path.to_s
    end
end