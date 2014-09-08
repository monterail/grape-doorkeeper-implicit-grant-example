module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Return all users' emails, doesn't require authentication"
        get '/' do
          User.all.pluck(:email)
        end

        desc 'Return current user, requires authentication'
        get 'me' do
          'This will return current user in the future'
        end
      end
    end
  end
end

