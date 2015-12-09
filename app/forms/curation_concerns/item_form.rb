# Generated via
#  `rails generate curation_concerns:work Item`
module CurationConcerns
  class ItemForm < CurationConcerns::Forms::WorkForm
    self.model_class = ::Item
    self.terms += [:abstract, :hlbTopLevel]
  end
end

