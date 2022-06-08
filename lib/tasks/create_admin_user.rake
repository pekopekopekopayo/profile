task :create_admin do
    user = User.new(email: ENV['email'], password: ENV['password'], authority: 1)
    user.save
end