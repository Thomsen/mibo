class User < ActiveRecord::Base
  validates :username, presence: true,
                        length: {minimum: 4}
  validates :password, presence: true,
                       length: {minimum: 6, maximum: 12}

  has_attached_file :portrait_uri, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :portrait_uri, :content_type => /\Aimage\/.*\Z/
    
end
