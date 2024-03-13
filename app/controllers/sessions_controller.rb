class SessionsController < ApplicationController
  def new
  end

  def create
    @User = User.find_by({"email" => params["email"]})
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome to your Journal"
        redirect_to "/places"
      else
        flash["notice"] = "Please Login"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Please Login"
      redirect_to "/login"
    end
  end

  def destroy
  end
end
  