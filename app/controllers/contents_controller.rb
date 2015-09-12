class ContentsController < ApplicationController

  def index
  end

  def create
    @content = Content.new(content_params)

    if attach_params.blank?
      puts 'attach is blank'
    else
      @packet = Attachpacket.create(user_id: @content.user_id, visible: 1, packet_desc: "")
      @attach = Attachment.new(attach_params)
      @attach.attach_packet_id = @packet.id
      @content.attach_packet_id = @packet.id # judge
      @attach.save
    end

    if @content.save
      redirect_to mains_index_path, flash: {u_id: @content.user_id}
    else
    end
  end

  def reply

  end

  def forward
    print("forward_params: " + forward_params.to_json);
    @forward_content = Content.new(forward_params)
    if @forward_content.save
      redirect_to mains_index_path
    else
    end
  end

  def destroy
  end

  private
  def content_params
    params.require(:content).permit(:text, :user_id)
  end

  def attach_params
    params.require(:content).permit(:attach)
  end

  def forward_params
    params.require(:forward).permit(:text, :source_id, :user_id)
  end

end
