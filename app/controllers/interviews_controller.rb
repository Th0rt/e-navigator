class InterviewsController < ApplicationController

  def index
    @user = current_user
    @interviews = current_user.interviews.all
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
    @interview = current_user.interviews.build(interview_params)
    @interview.save
    redirect_to interviews_path
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    @interview.update(interview_params)
    redirect_to interviews_url
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    redirect_to interviews_url
  end
end

private

def interview_params
  params.require(:interview).permit(:date)
end
