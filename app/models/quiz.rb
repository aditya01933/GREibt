class Quiz < ActiveRecord::Base
  belongs_to :user
   def self.set_frame_var(frame_var)
   	@frame_var = frame_var
   end
     
   def self.get_frame_var
    @get_frame_var
   end 	

 
end
