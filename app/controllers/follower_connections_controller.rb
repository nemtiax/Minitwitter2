class FollowerConnectionsController < ApplicationController
  before_action :set_follower_connection, only: [:show, :edit, :update, :destroy]

  # GET /follower_connections
  # GET /follower_connections.json
  def index
    @follower_connections = FollowerConnection.all
  end

  # GET /follower_connections/1
  # GET /follower_connections/1.json
  def show
  end

  # GET /follower_connections/new
  def new
	if(session[:user_id] == nil) 
		redirect_to login_url
	else 
		@follower = User.find(session[:user_id])
		@followee = User.find(params[:id])
		FollowerConnection.create(follower: @follower, followee: @followee)
		redirect_to(:back, notice: "You are now following #{@followee.name}!")
	end
  
    
  end

  # GET /follower_connections/1/edit
  def edit
  end

  # POST /follower_connections
  # POST /follower_connections.json
  def create
    @follower_connection = FollowerConnection.new(follower_connection_params)

    respond_to do |format|
      if @follower_connection.save
        format.html { redirect_to @follower_connection, notice: 'Follower connection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @follower_connection }
      else
        format.html { render action: 'new' }
        format.json { render json: @follower_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /follower_connections/1
  # PATCH/PUT /follower_connections/1.json
  def update
    respond_to do |format|
      if @follower_connection.update(follower_connection_params)
        format.html { redirect_to @follower_connection, notice: 'Follower connection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @follower_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follower_connections/1
  # DELETE /follower_connections/1.json
  def destroy
    @follower_connection.destroy
    respond_to do |format|
      format.html { redirect_to follower_connections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follower_connection
      @follower_connection = FollowerConnection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def follower_connection_params
      params.require(:follower_connection).permit(:follower_id, :followee_id)
    end
end
