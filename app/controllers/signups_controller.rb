class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_unprocessable_entity_response

    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end
