require 'spec_helper'
require 'external_file_data'

describe ExternalFileData do

  context 'with missing input' do
    let(:error_message) { 'URL to external resource was not supplied' }
    it 'raises an error' do
      expect(-> { described_class.new.mime_type }).to raise_error(StandardError, error_message)
    end
  end

  context 'just with URL' do
    let(:url) { 'http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg' }
    let(:original_name) { '287.jpg' }
    let(:mime_type) { "message/external-body; access-type=URL; URL=\"#{url}\"" }
    let(:file) { described_class.new(url: url) }
    it 'returns external mimetype' do
      expect(file.mime_type).to eq mime_type
    end
    it 'generates original_name' do
      expect(file.original_name).to eq original_name
    end
  end

  context 'with URL and original_name' do
    let(:url) { 'http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg' }
    let(:original_name) { 'homepage-sample-kitten.jpg' }
    let(:mime_type) { "message/external-body; access-type=URL; URL=\"#{url}\"" }
    let(:file) { described_class.new(url: url, original_name: original_name) }
    it 'returns external mimetype' do
      expect(file.mime_type).to eq mime_type
    end
    it 'generates original_name' do
      expect(file.original_name).to eq original_name
    end
  end

end
