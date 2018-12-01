class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.valid?
            #return json
            puts("user made and logged in")
        else
            render json: @user.to_json(only: :errors)
            puts("validation errors")
        end
    end

    def index
        @users = User.all
        puts("return user objects")
        render json: @users
    end

    def show
        @user = User.find(id: params[:id])
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :password, :email)
    end

    def img_params
        params.reuire(:user).permit(:img_url)
    end

end
