require 'rdf'
module DeepBlue
  module Vocab
    class ACL < RDF::StrictVocabulary('http://lib.umich.edu/auth/acl#')
      property :Deposit # extends http://www.w3.org/ns/auth/acl#Access
      property :Manage # extends http://www.w3.org/ns/auth/acl#Access

      # the intended reader of items deposited in the collection
      # if empty, items will inherit the collection's Read permissions
      property :intendedReader
    end

  end
end
