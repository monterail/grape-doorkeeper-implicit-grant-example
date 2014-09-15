users = %w(jon.snow hodor shae tyrion.lannister).map do |username|
  { email: "#{username}@winterfell.com", password: 'password' }
end

User.create(users)

oauth_app = {
  name:          'Angular Application',
  redirect_uri:  "http://#{ENV['HOST']}",
  uid:           ENV['APPLICATION_ID']
}

Doorkeeper::Application.create(oauth_app)

