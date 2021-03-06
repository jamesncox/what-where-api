class Api::V1::ItemsController < ApplicationController
    def index
        @items = Item.all 
        render json: @items, except: [:created_at, :updated_at], status: 200
    end

    def user_items
        @user = User.find_by(id: params[:id])
        @items = @user.items
        render json: @items, except: [:created_at, :updated_at],  status: 200
    end 

    def show
        @item = Item.find_by(id: params[:id])
        render json: @item, include: :store, status: 200
    end

    def create 
        @item = Item.new(item_params)
        @store = Store.find_by(id: params[:store_id])
        if @item.save
            render json: @item, status: 200
        else
            render json: { errors: @item.errors.full_messages}, status: 400
        end
    end 

    def update
        @item = Item.find_by(id: params[:id])
        if @item.update(item_params)
            render json: @item, status: 200
        else
            render json:  { errors: @item.errors.full_messages}, status: 400
        end
    end

    def destroy
        @item = Item.find_by(id: params[:id])
        @item.destroy
        render json: @item, status: 200
    end

    private 
        def item_params
            params.require(:item).permit(:name, :price, :quantity, :store_id)
        end
end
