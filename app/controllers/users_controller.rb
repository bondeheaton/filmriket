class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    @not_approved_users = User.where(access: nil)
    @approved_users = User.where(access: 1)
    @admin_users = User.where(access: 2)

    @users_join_club = User.where(status: 1)
    @users_start_club = User.where(status: 2)
    @users_looking_for_club = User.where(status: 3)
    @users_left_club = User.where(status: 4)
    @users_with_club = User.where(status: 5)

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: root_path }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @not_approved_users = User.where(access: nil)
    @approved_users = User.where(access: 1)
    @admin_users = User.where(access: 2)
    @user = User.find(params[:id])
    @user.update_attributes(:access => 1)
    respond_to do |format|
      if @user.update(:access => 1)
        format.js
      else
        format.js
      end
    end
  end

  def admin_approve
    @not_approved_users = User.where(access: nil)
    @approved_users = User.where(access: 1)
    @admin_users = User.where(access: 2)
    @user = User.find(params[:id])
    @user.update_attributes(:access => 2)
    respond_to do |format|
      if @user.update(:access => 2)
        format.js
      else
        format.js
      end
    end
  end

  def disapprove
    @not_approved_users = User.where(access: nil)
    @approved_users = User.where(access: 1)
    @admin_users = User.where(access: 2)
    @user = User.find(params[:id])
    @user.update_attributes(:access => nil)
    respond_to do |format|
      format.js
    end
  end

  def ajax_on_users
    if params[:term] != ""
      @not_approved_users = User.where("access = ? AND firstname LIKE ? OR lastname LIKE ? AND access IS ?",nil, "%#{params[:term]}%", "% #{params[:term]}%",nil)
      @approved_users = User.where("access = ? AND firstname LIKE ? OR lastname LIKE ? AND access = ?",1, "%#{params[:term]}%", "% #{params[:term]}%",1)
      @admin_users = User.where("access = ? AND firstname LIKE ? OR lastname LIKE ? AND access = ?",2, "%#{params[:term]}%", "% #{params[:term]}%",2)
    else
      @not_approved_users = User.where(access: nil)
      @approved_users = User.where(access: 1)
      @admin_users = User.where(access: 2)
    end
    respond_to do |format|
      format.js
    end
  end

  def disapprove_all
    @not_approved_users = User.where(access: nil)
    @approved_users = User.where(access: 1)
    @admin_users = User.where(access: 2)
    @users = User.where(access: 1)
    @users.each do |user|
      user.update_attributes(:access => nil)
    end
    respond_to do |format|
      format.js
    end
  end

  private

    def get_data
      @not_approved_users = User.where(access: nil)
      @approved_users = User.where(access: 1)
      @admin_users = User.where(access: 2)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :personalnumber, :phonenumber, :avatar, :adress, :city, :zipcode, :parentmail, :access, :agreement, :points, :status, :club_id)
    end
end
