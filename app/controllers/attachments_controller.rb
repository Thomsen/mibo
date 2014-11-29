class AttachmentsController < ApplicationController
  def show
  end
  def show_by_user
    if params[:user_id].blank?
      puts 'show_by_user no user_id'
    else
      @packets = Attachpacket.where("user_id = ?", params[:user_id])
      if @packets.nil?
      else
        @attachs = Attachment.where("attach_packet_id in (?)", @packets.ids)
      end
    end
  end
end
