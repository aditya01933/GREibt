class Userdetail < ActiveRecord::Base
	extend FriendlyId
  friendly_id :first_name, use: :slugged
	belongs_to :user
  #validates that one user can create just one user details
  validates_uniqueness_of :user_id, :message => "details already exist"

end
