class Api::V1::ItemsController < ApplicationController

    def index
        @items = Item.all 
        render json: @items, include: :store, status: 200
    end

    def show
        @item = Item.find_by(id: params[:id])
        render json: @item, include: :store, status: 200
    end

    def create 
        @item = Item.create(item_params)
        render json: @item, include: :store, status: 200
    end

end
