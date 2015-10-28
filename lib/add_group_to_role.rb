module AddGroupToRole
  extend ActiveSupport::Concern
  included do
    has_and_belongs_to_many :groups
  end  
end

Role.send(:include, AddGroupToRole)