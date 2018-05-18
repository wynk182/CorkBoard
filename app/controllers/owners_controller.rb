class OwnersController < ApplicationController

  def login

  end

  def recover
    if(owner = Owner.find_by_email(owner_params[:email]))
      subject = 'code recovery'
      message = "you have requested to recover your code so here it is #{owner.code}"
      ApplicationMailer.response_message(owner.email,subject,message).deliver_later
    end
    redirect_to boards_path, notice: 'email sent'
  end

  def auth
    if(@owner = Owner.find_by_code(owner_params[:code]))
      session[:code] = @owner.code
      redirect_to my_info_path @owner.id
    else
      redirect_back :fallback_location => boards_path, :notice => 'no match'
    end
  end

  def edit
    unless @owner
      redirect_to my_info_path
    end
  end

  def new
    if @owner
      redirect_to "/my_info/#{@owner.id}"
    else
      @owner = Owner.new(:code => SecureRandom.urlsafe_base64(8, false))
    end
  end

  def create
    respond_to do |format|
      if(@owner = Owner.create(owner_params))
        session[:code] = @owner.code
        @message = 'Success'
        format.js
      else
        @message = 'Error'
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @owner.update owner_params
        # @message = 'Success'
        @saved = true
        format.js
      else
        # @message = 'Error'
        @saved = false
        format.js
      end
    end


  end

  private
  def owner_params
    params.require(:owner).permit(:name, :email, :code)
  end
end