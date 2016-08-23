class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def build_gmaps_markers
    # If club params is present put this club first for centering map around this club
    if params[:id]
      club = Club.find(params[:id])
      verifiedclubs = club.verified_clubs
    else
      verifiedclubs = Club.where.not(longitude: nil)
    end
    # Create markers for google map
    Gmaps4rails.build_markers(verifiedclubs) do |club, marker|
      marker.lat club.latitude
      marker.lng club.longitude
      marker.picture({
                         :url     => ActionController::Base.helpers.asset_path(club.achievement_icon),
                         :width   => 32,
                         :height  => 32
                     })
      marker.infowindow "#{view_context.link_to club.name, club_path(club), class: 'menu-text-no-background movie-title', 'data-no-turbolink' => true}"
    end
  end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :firstname
      devise_parameter_sanitizer.for(:sign_up) << :lastname
      devise_parameter_sanitizer.for(:sign_up) << :address
      devise_parameter_sanitizer.for(:sign_up) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :avatar
      devise_parameter_sanitizer.for(:sign_up) << :parentfirstname
      devise_parameter_sanitizer.for(:sign_up) << :parentlastname
      devise_parameter_sanitizer.for(:sign_up) << :parentphonenumber
      devise_parameter_sanitizer.for(:sign_up) << :parentmail
      devise_parameter_sanitizer.for(:sign_up) << :ownemail
      devise_parameter_sanitizer.for(:sign_up) << :city
      devise_parameter_sanitizer.for(:sign_up) << :zipcode
      devise_parameter_sanitizer.for(:sign_up) << :personalnumber
      devise_parameter_sanitizer.for(:sign_up) << :access
      devise_parameter_sanitizer.for(:sign_up) << :phonenumber
      devise_parameter_sanitizer.for(:sign_up) << :status
      devise_parameter_sanitizer.for(:sign_up) << :statusmessage
      devise_parameter_sanitizer.for(:sign_up) << :agreement
      devise_parameter_sanitizer.for(:sign_up) << :points
    end
    
    def check_admin!
      if current_user == nil || current_user.access != 2
        redirect_to root_path
      end
    end
    
end
