class Post < ActiveRecord::Base
  #relation between topics and post
  belongs_to :topic

  belongs_to :user

  #post is valid only if it's associated with a topic:

   validates :topic_id, :presence => true
  #can also require that the referenced topic itself be valid
  #in order for the post to be valid:

  validates_associated :topic

  acts_as_votable



end
