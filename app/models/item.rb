# Generated via
#  `rails generate curation_concerns:work Item`
class Item < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  include ::DeepBlue::BasicMetadata
  validates_presence_of :title,  message: 'Your work must have a title.'

  def to_solr(solr_doc = {})
    if dateIssued
      super(solr_doc).tap do |solr_doc|
        solr_doc['dateIssuedYear_sim'] = dateIssued[0,4]
      end
    end
  end

  
end
