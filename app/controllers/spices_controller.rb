class SpicesController < ApplicationController

def index
    spices = Spice.all
    render json: spices
end

def create
    spices = Spice.create(spice_params)
    render json: spices, status: :created
end

def update
    spices = find_spices
    spices.update(spice_params)
    render json: spices, status: :created
end

def destroy
    spices = find_spices
    spices.destroy
    head :no_content
end


private

def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
end

def find_spices
    Spice.find_by(id: params[:id])
end

end
