module DeepBlue
  module BasicMetadata
    extend ActiveSupport::Concern

    included do

      property :dateAvailable, predicate: DeepBlue::Vocab::Terms.dateAvailable, multiple: false

      property :dateIssued, predicate: DeepBlue::Vocab::Terms.dateIssued, multiple: false

      property :classification, predicate: DeepBlue::Vocab::Terms.classification, multiple: false

      property :handleUrl, predicate: DeepBlue::Vocab::Terms.handleUrl, multiple: false

      property :affiliationUMCampus, predicate: DeepBlue::Vocab::Terms.affiliationUMCampus, multiple: true

      property :abstract, predicate: DeepBlue::Vocab::Terms.abstract, multiple: false

      property :discipline, predicate: DeepBlue::Vocab::Terms.discipline, multiple: true

      property :degreeGrantor, predicate: DeepBlue::Vocab::Terms.degreeGrantor, multiple: true

      property :committeeMember, predicate: DeepBlue::Vocab::Terms.committeeMember, multiple: true

      property :hlbTopLevel, predicate: DeepBlue::Vocab::Terms.hlbTopLevel, multiple: true  do |index|
        index.as :symbol
      end

      property :hlbSecondLevel, predicate: DeepBlue::Vocab::Terms.hlbSecondLevel, multiple: true  do |index|
        index.as :symbol
      end
      
    end
  end
end
