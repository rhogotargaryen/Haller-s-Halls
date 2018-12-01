class UsersController < ApplicationController
    validates :email, presence :true
    validates :email, uniquness :true
    validates :name, presence :true


    def create
        @user = User.new(user_params)
        if @user.save
            #return json
            console.log("user made")
        else
            #display errors
            console.log("validation errors")
        end
    end

    def index
        @users = User.All
        console.log("return user objects")
        #return json
    end

    def show
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :password, :email)
    end

end
