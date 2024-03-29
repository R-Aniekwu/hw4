class EntriesController < ApplicationController

  def new
    @user = User.find_by({ "id" => session["user_id"] })
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @post.uploaded_image.attach(params["post"]["uploaded_image"])
      @entry["place_id"] = params["place_id"]
      @entry.save
    else
      flash["notice"] = "Login to your session"
    end
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
