class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session
  #
  #TOinclude  imp  protect_from_forgery with: :exception

  #user authentication device
  #ADITYA: The line "before_action :authenticate_user!" will not allow user to see any page without authentication
  #OR We can include below line on the pages that we don't wat to show without authentication
  
  #Except will show index without login, We can also us "only:" to apply restriction to some elements
  before_action :authenticate_user!, except: [:index]
  
end
