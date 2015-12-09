class FieldConfig < ActiveRecord::Base
  belongs_to :collection_config
  acts_as_list scope: :collection_config

  def get_options
    JSON.load(self.options || '[]')
  end

  def set_options(data)
    self.options = JSON.dump(data)
  end

end
