class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :roles

  def has_role?(role)
    self.roles.where(name: role).exists?
  end

  validates :name, 
    uniqueness: true,
    format: { with: /\A[a-zA-Z0-9._-]+\z/,
      :message => "Only letters, numbers, hyphens, underscores and periods are allowed"}

end
