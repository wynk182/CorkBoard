class ResponsesController < ApplicationController

  def create
    @response = @owner.responses.new(response_params)
    respond_to do |format|
      if @response.save
        @post = Post.find(response_params[:post_id])
        unless @post.owner.email.nil? || @post.owner.email.empty?
          # send email to post_owner_email
          subject = "Your post #{@post.title} has received a response!"
          message = "#{(@owner.email) ? @owner.email : @owner.name_or_guest}, said \"#{@response.content}\""
          ApplicationMailer.response_message(@post.owner.email,subject,message).deliver_later
        end
        # send an email if the post owner has one
        format.js
        # else
        # format.js
      end
    end
  end

  def load_all
    @responses = Post.find(params[:post_id]).responses.all.order('id desc')
  end

  private
  def response_params
    params.require(:response).permit(:content, :post_id)
  end
end