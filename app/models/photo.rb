class Photo < ActiveRecord::Base
  attr_accessible :image
  attr_accessible :num_likes
  attr_accessible :num__dislikes
  
  has_attached_file :image,
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" }

end
