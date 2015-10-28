class RoleMapper
  def self.roles(uid)
    u = User.find_by_email(uid)
    return [] unless u
    u.roles.collect { |r| r.name }
  end
end
