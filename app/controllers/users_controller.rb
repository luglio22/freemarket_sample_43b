class UsersController < ApplicationController
  before_action :set_user, only:[:main_data, :sms_confirmation, :certification, :check, :address]
  require "date"
  def main_data
  end

  def sms_confirmation
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(users_params)
    redirect_to root_path
  end

  def payments
  end

  def set_user
    @user = User.new
  end

  def certification
    year =params[:user]['birthday(1i)'].to_s
    month =params[:user]['birthday(2i)'].to_s
    day = params[:user]['birthday(3i)'].to_s
    birthday = year + month + day
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:last_name] = params[:user][:last_name]
    session[:first_name] = params[:user][:first_name]
    session[:last_name_ja] = params[:user][:last_name_ja]
    session[:first_name_ja] = params[:user][:first_name_ja]
    session[:birthday] = birthday
  end

  def check
    session[:phone_number] = params[:user][:phone_number]
  end

  def address
  end

  def creditcard
    session[:postal_code] = params[:user][:postal_code]
    session[:prefecture] = params[:user][:prefecture]
    session[:city] = params[:user][:city]
    session[:add_ress] = params[:user][:add_ress]
    session[:building] = params[:user][:building]
    session[:phone_number] = params[:user][:phone_number]

    @user = User.new(nickname: session[:nickname],email: session[:email],password: session[:password],last_name: session[:last_name],first_name: session[:first_name],last_name_ja: session[:last_name_ja],first_name_ja: session[:first_name_ja],birthday: session[:birthday],postal_code: session[:postal_code],prefecture: session[:prefecture],city: session[:city],add_ress: session[:add_ress],building: session[:building],phone_number: session[:phone_number])
  end

  private
  def users_params
    params.require(:user).permit(:last_name, :first_name, :last_name_ja, :first_name_ja, :postal_code, :prefecture, :city, :add_ress, :building, :phone_number, :birthday)
  end
  def set_user
  @user = User.new
  end
end
