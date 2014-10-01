class Status < ActiveRecord::Base
  belongs_to :user, :foreign_key => "userid"
  belongs_to :resourcepacket, :foreign_key => "respacket_id"
end
