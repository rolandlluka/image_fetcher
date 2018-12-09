require 'open-uri'
class ImageFetcher
  #file reader method
  def reader(document)
    file_to_read = File.open(document, 'r')
    #iterate all the lines in the document
    file_to_read.each_line do |line|
    file_name = line.split('/').last
    #we open e file write for each link
    File.open("fetched_files/#{file_name}", 'wb') do |f|
      link = line.delete!("\n")
      f << open(link).read
    end
    end
    file_to_read.close
  end
end

file_reader = ImageFetcher.new
file_reader.reader('document')