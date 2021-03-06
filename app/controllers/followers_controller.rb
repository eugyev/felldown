class FollowersController < ApplicationController
  before_action :set_follower, only: [:edit, :update, :destroy]

  # GET /followers/new
  def new
    @follower = Follower.new
  end

  # GET /followers/1/edit
  def edit
  end

  # POST /followers
  def create
    @follower = Follower.new(follower_params)

    if @follower.save
      redirect_to root_path
      # redirect_to @follower, notice: 'Follower was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /followers/1
  def update
    if @follower.update(follower_params)
      redirect_to root_path
      # redirect_to @follower, notice: 'Follower was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /followers/1
  def destroy
    @follower.destroy
    redirect_to root_path, notice: 'Follower was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower
      @follower = Follower.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follower_params
      params.require(:follower).permit(:name, :number, :email, :icon)
    end
end
