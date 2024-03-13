class SessionsController < ApplicationController
  def new
  end

  def create
    @User = User.find_by({"username" => params["username"]})
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome to your Journal"
        redirect_to "/"
      else
        flash["notice"] = "Invalid login credentials"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Invalid login credentials"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye"
    redirect_to "/login"
  end
end
  