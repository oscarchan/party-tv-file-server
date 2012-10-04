class Photo < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :image
  attr_accessible :location
  attr_accessible :num_likes

  #composed_of :location, :class_name => 'Location', :mapping => %w(l)


  has_attached_file :image,
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" },
                    :storage => :s3,
                    #:s3_permissions => :private,
                    #:s3_credentials => "#{::Rails.root}/config/s3.yml",
                    :bucket => proc { self.bucket },

      :s3_credentials => {
          :access_key_id => "#{ENV['AWS_ACCESS_KEY_ID']}",
          :secret_access_key => "#{ENV['AWS_SECRET_ACCESS_KEY']}"
      },
                    :path => ":attachment/:id/:style.:extension"


  def self.bucket
      "#{Rails.application.class.parent.to_s.underscore.dasherize}-#{Rails.env}"
  end


end
