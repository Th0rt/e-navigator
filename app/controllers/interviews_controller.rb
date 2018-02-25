class InterviewsController < ApplicationController
  before_action :set_currentuser
  before_action :set_recruters

  def index
  end

  def past_interviews
    @user = User.find(params[:id])
    @interviews = @user.interviews.where("date > ?", Time.zone.now)
  end

  def show
      @user = User.find(params[:id])
      @interviews = @user.interviews.where(date: Time.zone.now..Float::INFINITY)
  end

  def new
    @interview = @user.interviews.build
  end

  def create
    @interview = @user.interviews.build(interview_params)
    @url = interviews_url(@interview)
    if @interview.save
      @recuruters.each do |recruter|
        NoticeMailer.sendmail_confirm(recruter.email,@interview.user, @url).deliver
      end
      redirect_to interview_path(@user)
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
