namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Emils",
                         :email => "emils.veveris@gmail.com",
                         :password => "Aeszinutavu5",
                         :password_confirmation => "Aeszinutavu5")
    admin.toggle!(:admin)
    end
end    