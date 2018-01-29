class InterviewsController < ApplicationController
  require "pry"
  before_action :set_currentuser

  def index
    @user = User.find(params[:id])
    @interviews = @user.interviews.all
  end

  def show
    @interviews = @user.interviews.all
  end

  def new
    @interview = @user.interviews.build
  end

  def create
    @interview = @user.interviews.build(interview_params)
    @url = interviews_url(params: { id: @interview.user_id })
    if @interview.save
      NoticeMailer.sendmail_confirm(@user, @url).deliver
      redirect_to interviews_path(params: { id: @interview.user_id })
    else
      render :new
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    @url = interviews_url(params: { id: @interview.user_id })
    if @interview.update(interview_params)
      NoticeMailer.sendmail_confirm(@interview.user, @url).deliver
      redirect_to interviews_url(params: { id: @interview.user_id })
    else
      render :edit
    end
  end

  def update_all
    params.permit!
    params[:interviews].keys.each do | interview_id |
      @interview = Interview.find(interview_id.to_i)
      @status = params[:interviews].fetch(interview_id)
      @change = true if @interview.update(@status)
    end
    if @change == true
      @url = interviews_url(params: { id: @interview.user_id })
      NoticeMailer.sendmail_confirm(@interview.user, @url).deliver
      redirect_to interviews_url(params: { id: @interview.user_id })
    else
      render :edit
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @url = interviews_url(params: { id: @interview.user_id })
    @interview.destroy
    NoticeMailer.sendmail_confirm(@interview.user, @url).deliver
    redirect_to interviews_url(params: { id: @interview.user_id } )
  end
end

private

def interview_params
  params.require(:interview).permit(:date, :status)
end
