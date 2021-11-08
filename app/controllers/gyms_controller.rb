class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :gym_not_found

    def index
        gym = Gym.all
        render json: gym
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def update
        gym = Gym.find(params[:id]).update!(gym_params)
        render json: gym, status: :created
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def gym_not_found
        render json: { error: "Gym not found" }, status: :not_found
    end

end
