class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :client_not_found

    def show
        client = Client.find(params[:id])
        render json: client
    end

    private 
    def client_not_found
        render json: { error: "Client not found" }, status: :not_found
    end
end
