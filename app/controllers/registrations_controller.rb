class RegistrationsController < Devise::RegistrationsController
  
  def create
  	super do |resource|
   
    end

  	
  end



  protected
  def after_sign_up_path_for(resource)
    new_userdetail_path
  end
end