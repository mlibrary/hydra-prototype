module DeepBlue
  module AccessControls
    module CollectionPermissions
      extend ActiveSupport::Concern

      # # eventually
      # def to_solr(solr_doc = {})
      #   super.tap do |doc|
      #     [:deposit, :manage, :intended_reader].each do |access|
      #       vals = send("#{access}_groups")
      #       doc[Hydra.config.permissions[access].group] = vals unless vals.empty?
      #       vals = send("#{access}_users")
      #       doc[Hydra.config.permissions[access].individual] = vals unless vals.empty?
      #     end
      #   end
      # end

      PERMISSIONS = {
        deposit:  DeepBlue::Vocab::ACL.Deposit,
        manage:  DeepBlue::Vocab::ACL.Manage,
        intended_reader: DeepBlue::Vocab::ACL.intendedReader
      } 

      PERMISSIONS.each do |permission, acl|

        # Return a list of groups that have permission
        define_method("#{permission}_groups") do
          search_by_type_and_mode(:group, acl).map { |p| p.agent_name }
        end

        define_method("#{permission}_groups=") do |groups|
          # set_deposit_groups(groups, self.send("#{permission}_groups".to_sym))
          set_entities(permission.to_sym, :group, groups, self.send("#{permission}_groups"))
        end

        define_method("#{permission}_users") do
          search_by_type_and_mode(:person, acl).map { |p| p.agent_name }
        end

        define_method("#{permission}_users=") do |users|
          # set_deposit_groups(groups, self.send("#{permission}_groups".to_sym))
          set_entities(permission.to_sym, :person, users, self.send("#{permission}_users"))
        end

        define_method("#{permission}_users_string") do
          self.send("#{permission}_users").join(', ')
        end

        define_method("#{permission}_users_string=") do |users|
          self.send("#{permission}_users=", users.split(/[\s,]+/))
        end

        define_method("#{permission}_groups_string") do
          self.send("#{permission}_groups").join(', ')
        end

        define_method("#{permission}_groups_string=") do |groups|
          self.send("#{permission}_groups=", groups.split(/[\s,]+/))
        end

      end

      def permission_to_uri(permission)
        if PERMISSIONS[permission]
          PERMISSIONS[permission]
        else
          case permission.to_s
          when 'read'
            ::ACL.Read
          when 'edit'
            ::ACL.Write
          when 'discover'
            Hydra::ACL.Discover
          else
            raise "Invalid permission #{permission.inspect}"
          end
        end
      end

    end
  end
end