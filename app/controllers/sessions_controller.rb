class SessionsController < ApplicationController

    def create
        if auth_hash
          @user = User.find_or_create_by_oauth(auth_hash)
          session[:user_id] = @user.id
          #return json
          puts "user found and logged in through oauth"
        else @user = User.find_by(name: params[:user][:name])
             if @user.authenticate(params[:user][:password])
               session[:user_id] = @user.id
               #return json
             else
               #return errors
             end
        end
      end

    def destroy
        reset_session
        puts 'logged out'
        redirect_to '/'
    end

    private
    
    def auth_hash
        request.env['omniauth.auth']
    end

end
