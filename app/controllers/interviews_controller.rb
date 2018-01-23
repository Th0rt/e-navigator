class InterviewsController < ApplicationController

  def index
    @user = User.find (params[:id])
    @interviews = @user.interviews.all
  end

  def show
    @user = current_user
    @interviews = current_user.interviews.all
  end

  def new
    @user = current_user
    @interview = current_user.interviews.build
  end

  def create
    @user = current_user
    @interview = @user.interviews.build(interview_params)
    @interview.save
    NoticeMailer.sendmail_confirm(@user).deliver
    redirect_to interviews_path(params: { id: @interview.user_id } )
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    @interview.update(interview_params)
    NoticeMailer.sendmail_confirm(@interview.user).deliver
    redirect_to interviews_url(params: { id: @interview.user_id } )
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    NoticeMailer.sendmail_confirm(@interview.user).deliver
    redirect_to interviews_url(params: { id: @interview.user_id } )
  end
end

private

def interview_params
  params.require(:interview).permit(:date, :status)
end
