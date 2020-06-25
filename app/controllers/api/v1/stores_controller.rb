class Api::V1::StoresController < ApplicationController
    def index
        @stores = Store.all 
        render json: @stores, except: [:created_at, :updated_at], status: 200
    end

    def user_stores
        @user = User.find_by(id: params[:id])
        @stores = @user.stores
        render json: @stores, except: [:created_at, :updated_at], status: 200
    end

    def show 
        @store = Store.find_by(id: params[:id])
        render json: @store, status: 200
    end 

    def create 
        @store = Store.new(store_params)
        if @store.save
            render json: @store, include: :items, status: 200
        else
            render json: { errors: @store.errors.full_messages}, status: 400
        end
    end 

    def update 
        @store = Store.find_by(id: params[:id])
        if @store.update(store_params)
            render json: @store, include: :items, status: 200
        else
            render json: { errors: @store.errors.full_messages}, status: 400
        end
    end

    def destroy
        @store = Store.find_by(id: params[:id])
        @store.items.delete_all
        @store.destroy
        render json: @store, status: 200
    end 

    private 
        def store_params
            params.require(:store).permit(:name, :store_type, :color, :user_id)
        end
end
