class ExternalFileData < StringIO

  # Use in place of file/URI in https://github.com/projecthydra-labs/hydra-works/wiki/Lesson%3A-Add-attached-files
  # > a_external_data = ExternalFileData.new('6899R_3A', 'http://quod.lib.umich.edu/cgi/i/image/api/image/apis/3009/6899R_3A.TIF/full/res:3')
  # > a_generic_file = GenericFile.find('file-1')
  # > Hydra::Works::UploadFileToGenericFile(a_generic_file, a_external_data)
  
  # pcdm:File behaves according to https://wiki.duraspace.org/display/FEDORA4x/External+Content

  attr_accessor :url
  attr_accessor :original_name

  def initialize(original_name: nil, url: nil)
    @url = url
    @original_name = original_name || slugify
    super()
  end

  def mime_type
    raise 'URL to external resource was not supplied' if @url.nil?
    "message/external-body; access-type=URL; URL=\"#{@url}\""
  end

  def url=(url)
    @url = url
    @original_name = slugify if @original_name.nil?
  end

  private
    def slugify
      if @url.nil?
        return nil
      end
      tmp = url
      last_idx = -1
      while url[0..last_idx] == '/'
        last_idx -=1 
      end
      File.basename(url[0..last_idx])
    end

end
