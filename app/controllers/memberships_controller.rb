class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :membership_data_invalid

    def create
        new_membership = Membership.create!(membership_params)
        render json: new_membership, status: :created
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def membership_data_invalid(error_messages)
        render json: { errors: error_messages.record.errors.full_messages }, status: :unprocessable_entity   
		end


end
