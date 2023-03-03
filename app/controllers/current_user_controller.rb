class CurrentUserController < ApplicationController
  # will return 401 unless user is logged in
  before_action :authenticate_user!

  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end
