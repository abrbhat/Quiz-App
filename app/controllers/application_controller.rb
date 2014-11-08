class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_viewer_in_session
  private
 
  def set_viewer_in_session
  	if cookies[:viewer_id] && !session[:viewer_id]
  		session[:viewer_id] = cookies[:viewer_id]
  	end  
  end
  
  def current_viewer
  	if session[:viewer_id]
  		viewer = Viewer.find_by(id: session[:viewer_id])
  	elsif cookies[:viewer_id]
  		viewer = Viewer.find_by(id: cookies[:viewer_id])
  	end   
  	return viewer   
  end
end
