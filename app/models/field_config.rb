class FieldConfig < ActiveRecord::Base
  belongs_to :collection_config
  acts_as_list scope: :collection_config
end
