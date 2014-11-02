class ContentsController < ApplicationController

  def create
    @content = Content.new(status_params)
    if @content.save
      redirect_to main_index_path, flash: {u_id: @content.user_id}
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
