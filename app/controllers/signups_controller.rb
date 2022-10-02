class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_unprocessable_entity_response

    def index
        signups = Signup.all
        render json: signups
    end

    def show
        signup = find_signup
        render json: signup
    end

    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    end

    private

    def find_signup
        Signup.find(params[:id])
    end

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
