class UserrsController < ApplicationController
  before_action :authenticate_user!
  def index
    @userrs = Userr.all
  end

  def new
    @userr = Userr.new
  end

  def show
    @userr = Userr.find(params[:id])
  end

  def create
    @userr = Userr.new(userr_params)
    if @userr.save
      redirect_to userrs_path
    else
      render :new
    end
  end

  def destroy
    @userr = Userr.find(params[:id])
    @userr.destroy

    redirect_to userrs_path
  end


  private
    def userr_params
      params.require(:userr).permit(:name, :email)
    end
end
