class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @ledgers = Ledger.where ("user = current_user")
  end
end
