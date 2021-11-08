class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :client_not_found

    def index
        clients = Client.all
        render json: clients
    end

    def show
        client = Client.find(params[:id])
        render json: client, methods: :client_total
    end

    def update
        client = Client.find(params[:id]).update!(client_params)
        render json: client, status: :ok
    end

    private 

    def client_params
        params.permit(:name, :age)
    end

    def client_not_found
        render json: { error: "Client not found" }, status: :not_found
    end

    def client_total
        client.find(params[:id])
        client.memberships.sum(:charge)
    end
end
