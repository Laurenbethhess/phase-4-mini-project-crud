class SpicesController < ApplicationController

    def index
        render json: Spice.all
    end

    # def show
    #     render json: Plant.find_by(id: params[:id])
    # end

    def create
        render json: Spice.create(spice_params), status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        Spice.find_by(id: params[:id]).destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
