class User < ActiveRecord::Base
  validates :username, presence: true,
                        length: {minimum: 4}
  validates :password, presence: true,
                       length: {minimum: 6, maximum: 12}
  
end
