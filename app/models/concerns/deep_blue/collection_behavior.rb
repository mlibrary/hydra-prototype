module DeepBlue
  module CollectionBehavior
    extend ActiveSupport::Concern

    include ::DeepBlue::AccessControls::CollectionPermissions

    def can_deposit?(user)
      return true if user.admin?
      return true if deposit_users.index(user.to_s)
      ! ( deposit_groups & user.groups ).empty?
    end

    def can_manage?(user)
      return true if user.admin?
      return true if manage_users.index(user.to_s)
      ! ( manage_groups & user.groups ).empty?
    end

  end
end