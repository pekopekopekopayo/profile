task :create_master_user do
    user = User.new(email: ENV['email'], password: ENV['password'], authority: 'Master')
    user.save(validate: false)
end