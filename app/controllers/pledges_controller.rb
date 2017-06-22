class PledgesController < ApplicationController
  before_action :require_login

  def create
    @project = Project.find(params[:project_id])

    if current_user.id != @project.owner
      @pledge = @project.pledges.build(pledge_params)
      @pledge.user = current_user

      if @pledge.save
        redirect_to project_url(@project), notice: "You have successfully backed #{@project.title}!"
      else
        flash.now[:alert] = @pledge.errors.full_messages.first
        render 'projects/show'
      end
    else
      return false
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:dollar_amount)
  end
end
