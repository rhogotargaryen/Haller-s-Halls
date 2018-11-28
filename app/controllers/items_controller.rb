class ItemsController < ApplicationController
    validates :name, presence :true
    validates :name, uniquness :true

    def create
        @item = Item.new(item_params)
    end

    def index
    end

    def show
    end

    private
    def item_params
        params.require(:user).permit(:name, :description)
end
