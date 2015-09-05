class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :firstname
      devise_parameter_sanitizer.for(:sign_up) << :lastname
      devise_parameter_sanitizer.for(:sign_up) << :address
      devise_parameter_sanitizer.for(:sign_up) << :parentmail
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
    
    def club_bookings(clubid)
      @count = []
      @club = Club.find(clubid)
      @members = @club.users
      @members.each do |member|
        @count.push(member.bookings.count)
      end
      return @count.inject(:+)
    end
    
end
