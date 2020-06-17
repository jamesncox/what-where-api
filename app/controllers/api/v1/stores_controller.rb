class Api::V1::StoresController < ApplicationController
    def index
        @stores = Store.all 
        render json: @stores, include: :items, except: [:created_at, :updated_at], status: 200
    end

    def user_stores
        # this ALWAYS renders :user_id 2 (Emily C) regardless of who is logged in
        @user = User.find_by(params[:user_id])
        @stores = Store.where(:user_id => @user)
        byebug
        render json: @stores, include: :items, except: [:created_at, :updated_at], status: 200
    end

    def show 
        @store = Store.find_by(id: params[:id])
        render json: @store, include: :items, status: 200
    end 

    def create 
        @store = Store.new(store_params)
        # @user = User.find_by(id: params[:user_id])
        if @store.save
            render json: @store, include: :items, status: 200
        else
            render json: { errors: @store.errors.full_messages}, status: 400
        end
    end 

    def update 
        @store = Store.find_by(id: params[:id])
        @store.update(store_params)
        render json: @store, include: :items, status: 200
    end

    def destroy
        @store.destroy
        head :no_content
    end 

    private 
        def store_params
            params.require(:store).permit(:name, :store_type, :color, :user_id)
        end
end
