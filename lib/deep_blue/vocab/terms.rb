# -*- encoding: utf-8 -*-
require 'rdf'
module DeepBlue
  module Vocab
    class Terms < RDF::StrictVocabulary('http://lib.umich.edu/models#')

      property :dateAvailable,
        label: "Date Available".freeze,
        subPropertyOf: "dc:date".freeze,
        type: "rdf:Property".freeze

      property :dateIssued,
        label: "Date Issued".freeze,
        subPropertyOf: "dc:date".freeze,
        type: "rdf:Property".freeze

      property :citation,
        label: "Citation".freeze,
        subPropertyOf: "dc:identifier".freeze,
        type: "rdf:Property".freeze

      property :handleUrl,
        label: "Handle URL".freeze,
        subPropertyOf: "dc:identifier".freeze,
        type: "rdf:Property".freeze

      property :classification,
        label: "Classification".freeze,
        subPropertyOf: "dc:subject".freeze,
        type: "rdf:Property".freeze

      property :affiliationUMCampus,
        label: "UM Campus".freeze,
        subPropertyOf: "dcterms:contributor".freeze,
        type: "rdf:Property".freeze

      property :hlbTopLevel,
        label: "HLB Top Level".freeze,
        subPropertyOf: "dc:subject".freeze,
        type: "rdf:Property".freeze

      property :hlbSecondLevel,
        label: "HLB Second Level".freeze,
        subPropertyOf: "dc:subject".freeze,
        type: "rdf:Property".freeze

      property :abstract,
        label: "Abstract".freeze,
        subPropertyOf: "dc:description".freeze,
        type: "rdf:Property".freeze

      property :discipline,
        label: "Discipline".freeze,
        subPropertyOf: "dc:description".freeze,
        type: "rdf:Property".freeze

      property :degreeGrantor,
        label: "Degree Grantor".freeze,
        subPropertyOf: "dc:contributor".freeze,
        type: "rdf:Property".freeze

      property :committeeMember,
        label: "Committee Member".freeze,
        subPropertyOf: "dc:contributor".freeze,
        type: "rdf:Property".freeze



    end
  end
end
