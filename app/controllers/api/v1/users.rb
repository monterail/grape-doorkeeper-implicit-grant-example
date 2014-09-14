module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      doorkeeper_for :all

      helpers do
        def current_token; env['api.token']; end
        def warden; env['warden']; end

        def current_resource_owner
          User.find(current_token.resource_owner_id) if current_token
        end
      end

      resource :users do
        desc "Return all users' emails, doesn't require authentication"
        get '/', protected: false do
          User.all.pluck(:email)
        end

        desc 'Return current user, requires authentication'
        get 'me' do
          current_resource_owner
        end

        desc 'Logout user'
        delete 'logout' do
          warden.logout
        end
      end
    end
  end
end

