module DeepBlue
  module SolrDocumentBehavior
    extend ActiveSupport::Concern

    def abstract
      fetch(Solrizer.solr_name('abstract'), [])
      # Array(self[Solrizer.solr_name('abstract')]).first
    end

  end
end