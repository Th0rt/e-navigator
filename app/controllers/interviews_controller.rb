class InterviewsController < ApplicationController
  require "pry"
  before_action :set_currentuser
  before_action :set_recruters

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
      @recuruters.each do |recruter|
        NoticeMailer.sendmail_confirm(recruter.email,@interview.user, @url).deliver
      end
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
      @recuruters.each do |recruter|
        NoticeMailer.sendmail_confirm(recruter, @url).deliver
      end
      redirect_to interviews_url(params: { id: @interview.user_id })
    else
      render :edit
    end
  end

  def update_all
    params.permit!
    params[:interviews].each do |id, status|
      @interview = Interview.find(id)
      @update_flg = true if @interview.update(status)
    end
    if @update_flg == true
      @url = interviews_url(params: { id: @interview.user_id })
      NoticeMailer.sendmail_confirm(@interview.user.email,@interview.user, @url).deliver
      redirect_to interviews_url(params: { id: @interview.user_id } )
    else
      render :edit
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @url = interviews_url(params: { id: @interview.user_id })
    @interview.destroy
    @recuruters.each do |recruter|
      NoticeMailer.sendmail_confirm(recruter, @url).deliver
    end
    redirect_to interviews_url(params: { id: @interview.user_id } )
  end
end

private

def interview_params
  params.require(:interview).permit(:date, :status)
end

def set_recruters
  @recuruters = User.where(role: "recruter")
end
