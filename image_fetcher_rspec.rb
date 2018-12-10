require 'rspec'
require_relative 'image_fetcher'
describe ImageFetcher do
  describe '#reader' do
    it "should read file and download images" do
      @buffer = StringIO.new()
      @filename = "filename2.png"
      @content = "https://upload.wikimedia.org/wikipedia/commons/e/ee/Chain_link_icon.png"
      allow(File).to receive(:read).with(@filename,'wb').and_yield( @buffer)

      # call the function that writes to the file
      File.open(@filename, 'wb') {|f| f << open(@content).read}

      # reading the buffer and checking its content.
      expect(@buffer.string).to eq(@content)

    end
  end
end