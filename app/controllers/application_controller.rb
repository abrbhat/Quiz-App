class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_viewer_in_session
  Time.zone = 'Kolkata'
  
  private

  def set_viewer_in_session
    if cookies.signed[:viewer_secret] && !session[:viewer_secret]
      session[:viewer_secret] = cookies.signed[:viewer_secret]
    elsif !cookies[:viewer_secret]
      viewer = Viewer.new
      viewer.save
      session[:viewer_secret] = viewer.secret
      cookies.permanent.signed[:viewer_secret] = viewer.secret
    end
  end
  
  def current_viewer
  	if session[:viewer_secret]
  		viewer = Viewer.find_by(secret: session[:viewer_secret])
  	elsif cookies.signed[:viewer_secret]
  		viewer = Viewer.find_by(secret: cookies.signed[:viewer_secret])
  	end   
  	return viewer   
  end
end
