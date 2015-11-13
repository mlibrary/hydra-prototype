class Ability
  include Hydra::Ability
  
  include CurationConcerns::Ability
  ### self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions
    if current_user.admin?
      can [:create, :show, :add_user, :remove_user, :index, :edit, :update, :destroy], Role
      can [:create], Collection
      can [:discover], Hydra::AccessControls::Embargo
      can [:discover], Hydra::AccessControls::Lease
      can [:create], [ CurationConcerns.config.curation_concerns ]
      can [:destroy], ActiveFedora::Base
    end

    # Limits deleting objects to a the admin user
    #
    #if current_user.admin?
    #  can [:destroy], ActiveFedora::Base
    #end

    if current_user.has_role?('collection.manager')
      # can [:create, :show, :index, :edit, :update, :destroy], Collection
      can [:create], Collection
    end

    if current_user.has_role?('collection.depositor') or current_user.has_group_role?('collection.depositor')
      # can [:create, :show, :index, :edit, :update, :destroy], [ CurationConcerns.configuration.curation_concerns ]
      can [:create], [ CurationConcerns.config.curation_concerns ]
      # can [:show], Collection
    end

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end
  end
end
