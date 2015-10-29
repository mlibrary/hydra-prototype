# Generated via
#  `rails generate curation_concerns:work Item`

class CurationConcerns::ItemsController < ApplicationController
  include CurationConcerns::CurationConcernController
  set_curation_concern_type Item
end
