class ContentsController < ApplicationController

  def index
  end
  
  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to mains_index_path, flash: {u_id: @content.user_id}
    else
    end
  end

  def reply
  end

  def forward
  end

  def delete
  end

  private
  def content_params
    params.require(:content).permit(:text, :user_id)
  end

end
