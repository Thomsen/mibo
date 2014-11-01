class StatusesController < ApplicationController
  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to main_index_path, flash: {u_id: @status.user_id}
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
  def status_params
    params.require(:status).permit(:content, :user_id)
  end
  
end
