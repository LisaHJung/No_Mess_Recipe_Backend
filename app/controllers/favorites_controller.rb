class FavoritesController < ApplicationController
    before_action :authenticate, only: [:index, :create]
    
    def index
       @favorites = Favorite.all
        render json:@favorites
    end

    def show
       @favorites = Favorite.where(user_id: params[:id])
        render json:@favorites
    end

    def create
        @favorite = Favorite.create(favorite_params)
        render json: @favorite
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
        render status: :no_content
    end 
        

    private

    def favorite_params
        params.require(:favorite).permit(:name, :image, :video, :ingredients, :instructions).merge(user_id: @user_id)
    end
end
