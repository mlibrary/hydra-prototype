namespace :prototype do
    desc 'install default admin users'
    task :install_admin_users => :environment do
      admin_users = [
        'roger@umich.edu',
        'njaffer@umich.edu',
        'blancoj@umich.edu',
        'gordonl@umich.edu',
        'krenee@umich.edu',
        'khage@umich.edu',
        'jweise@umich.edu',
      ]

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
      end

    end
end
