class CurrentUserController < ApplicationController
  # will return 401 unless user is logged in
  before_action :authenticate_user!
  def index
    if current_user
      puts current_user
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    else
      render status: 402, message: "Couldn't find an active session."
    end
  end
end
