class SessionsController < ApplicationController

    def create
        if auth
          @user = User.find_or_create_by(fb_id: auth[:uid]) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.img_url = auth['info']['image']
          end
          session[:user_id] = @user.id
          puts("user found through FB")
          render json: @user
        else @user = User.find_by(name: params[:user][:name])
          if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            render json: @user
          else
            #return errors
          end
      end
    end

    def destroy
        reset_session
        puts('logged out')
        redirect_to '/'
    end

    private
    
    def auth
        request.env['omniauth.auth']
    end

end
