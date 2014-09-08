users = %w(jon.snow hodor shae tyrion.lannister).map do |username|
  { email: "#{username}@winterfell.com", password: 'password' }
end

User.create(users)

