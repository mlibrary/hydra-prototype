namespace :prototype do
  desc 'install sample roles'
  task :install_sample_roles => :environment do
    [ 'admin', 'collection.manager', 'collection.depositor' ].each do |name|
      r = Role.find_by_name(name)
      if r.nil?
        r = Role.new name: name
        r.save
        STDERR.puts "installed role: #{r.name}"
      end
    end
  end

  desc 'install superusers group'
  task :install_superusers_group => :environment do
    r = Role.find_by_name('admin')
    g = Group.new name: 'superusers'
    g.save
    g.roles << r
  end

  desc 'install superusers'
  task :install_superusers => :environment do
    admin_users = [
      'roger@umich.edu',
      'njaffer@umich.edu',
      'blancoj@umich.edu',
      'gordonl@umich.edu',
      'krenee@umich.edu',
      'khage@umich.edu',
      'jweise@umich.edu',
    ]

    g = Group.find_by_name('superusers')
    admin_users.each do |email|
      u = User.where(email: email).first
      if u.nil?
        u = User.create!(email: email, password: 'mgoblue!')
        if u.nil?
          STDERR.puts "#{email} not created"
        else
          STDERR.puts "installed: #{u.id} : #{u.email} : #{u.guest}"
        end
      end
      u.user_groups << g
    end
  end

  desc 'add user'
  task :add_user, [:email, :password, :group] => :environment do |t, args|
    args.with_defaults(:password => 'mgoblue!', :group => nil)
    email = args[:email]
    password = args[:password] == '' ? 'mgoblue!' : args[:password]
    group = args[:group]
    u = User.where(email: email).first
    if u.nil?
      u = User.create!(email: email, password: password)
      if u.nil?
        STDERR.puts "#{email} not created"
      else
        STDERR.puts "installed: #{u.id} : #{u.email}"
      end
    end
    if group
      g = Group.find_by_name(group)
      u.user_groups << g
      STDERR.puts "updated: #{email} : #{group}"
    end
  end

  desc 'add role to user'
  task :add_role_to_user, [:role, :email] => :environment do |t, args|
    u = User.find_by_email(args[:email])
    r = Role.find_by_name(args[:role])
    u.roles << r
  end

  desc 'add role to group'
  task :add_role_to_group, [:role, :group] => :environment do |t, args|
    g = Group.find_by_name(args[:group])
    r = Role.find_by_name(args[:role])
    g.roles << r
  end

  desc 'add user to group'
  task :add_user_to_group, [:email, :group] => :environment do |t, args|
    g = Group.find_by_name(args[:group])
    u = User.find_by_email(args[:email])
    u.user_groups << g
  end

  desc 'add group'
  task :add_group, [:name, :role] => :environment do |t, args|
    name = args[:name]
    role = args[:role]
    g = Group.where(name: name).first
    if g.nil?
      g = Group.create!(name: name)
      if g.nil?
        STDERR.puts "#{name} not created"
      else
        STDERR.puts "installed: #{g.id} : #{g.name}"
      end
    end
    if role
      r = Role.find_by_name(role)
      g.roles << r
      STDERR.puts "updated: #{name} : #{role}"
    end
  end

  desc 'add role'
  task :add_role, [:name] => :environment do |t, args|
    name = args[:name]
    r = Role.where(name: name).first
    if r.nil?
      r = Role.create!(name: name)
      if r.nil?
        STDERR.puts "#{name} not created"
      else
        STDERR.puts "installed: #{r.id} : #{r.name}"
      end
    end
  end

end
