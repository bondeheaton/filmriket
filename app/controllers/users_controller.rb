class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create, :disapprove_all]
  before_action :set_user_access_types, only: [:index, :approve, :admin_approve, :disapprove, :disapprove_all, :ajax_on_users]

  before_filter :check_admin!

  def index
    @users_join_club = User.where(status: 1)
    @users_start_club = User.where(status: 2)
    @users_looking_for_club = User.where(status: 3)
    @users_left_club = User.where(status: 4)
    @users_with_club = User.where(status: 5)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

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

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @user.update_attributes(:access => 1)
    respond_to do |format|
      if @user.update(:access => 1)
        format.js
      else
        format.js
      end
    end
  end

  def mobile_approve
    @user.update_attributes(:access => 1)
    redirect_to :back
  end

  def admin_approve
    @user.update_attributes(:access => 2)
    respond_to do |format|
      if @user.update(:access => 2)
        format.js
      else
        format.js
      end
    end
  end

  def mobile_admin_approve
    @user.update_attributes(:access => 2)
    redirect_to :back
  end


  def disapprove
    @user.update_attributes(:access => nil)
    respond_to do |format|
      format.js
    end
  end

  def mobile_disapprove
    @user.update_attributes(:access => nil)
    redirect_to :back
  end

  def ajax_on_users
    if params[:term] != ""
      @not_approved_users = User.where("access = ? AND firstname LIKE ? OR lastname LIKE ? AND access IS ?",nil, "%#{params[:term]}%", "% #{params[:term]}%",nil)
      @approved_users = User.where("access = ? AND firstname LIKE ? OR lastname LIKE ? AND access = ?",1, "%#{params[:term]}%", "% #{params[:term]}%",1)
      @admin_users = User.where("access = ? AND firstname LIKE ? OR lastname LIKE ? AND access = ?",2, "%#{params[:term]}%", "% #{params[:term]}%",2)
    end
    respond_to do |format|
      format.js
    end
  end

  def disapprove_all
    @users = User.where(access: 1)
    @users.each do |user|
      user.update_attributes(:access => nil)
    end
    respond_to do |format|
      format.js
    end
  end
  
  def manual_user_confirmation
    unless @user.email == @user.ownemail
      @user.parentmail = @user.email
      @user.email = @user.ownemail
      @user.skip_confirmation!
      @user.confirm
      @user.save
    end
    redirect_to :back
  end

  private

    def set_user_access_types
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
      params.require(:user).permit(:firstname, :lastname, :personalnumber, :phonenumber, :avatar, :adress, :city,
                                   :zipcode, :parentfirstname, :parentlastname, :parentphonenumber, :parentmail,
                                   :access, :agreement, :points, :status, :club_id)
    end
end
