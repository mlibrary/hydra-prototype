# Generated via
#  `rails generate curation_concerns:work Rackham`
class Rackham < ActiveFedora::Base
  include ::CurationConcerns::GenericWorkBehavior
  include ::CurationConcerns::BasicMetadata
  include ::DeepBlue::BasicMetadata
  validates_presence_of :title,  message: 'Your work must have a title.'
end
