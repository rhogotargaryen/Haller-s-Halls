class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            #return json
            puts("user made and logged in")
        else
            #display errors
            puts("validation errors")
        end
    end

    def index
        @users = User.all
        puts("return user objects")
        render json: @users
    end

    def show
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :password, :email)
    end

end
