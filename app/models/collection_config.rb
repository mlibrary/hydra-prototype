class CollectionConfig < ActiveRecord::Base
  has_many :field_configs, -> { order(position: :asc) }
end
