class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def home
    @posts = Post.where(:verified => true).order('Rand()').limit(50)
  end

  # GET /posts
  # GET /posts.json
  def index
    @board = Board.find(params[:board_id])
    @posts = @board.posts.where(:verified => true).limit(12)
  end

  def verify
    if @owner&.sa?
      @posts = Post.where(:verified => false)
    else
      redirect_to boards_path
    end
  end

  def verified
    if @owner.sa?
      @post = Post.find(params[:post_id])
      @post.update(:verified => true)
      redirect_to verify_posts_path
    end
  end

  def my_posts
    respond_to do |format|
      if @owner
        @posts = @owner.posts.all.limit(12)
        #@posts << Post.where(:owner_email => @owner.email)
        #@posts << Post.where(:owner_code => @owner.code)
        format.html {render :my_posts}
      else
        # format.html {redirect_to boards_path, notice: 'You do not have an owner ID'}
        format.html {redirect_to login_path}
      end
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @board = Board.find(params[:board_id])
    @post = @board.posts.new
    @post.build_upload
  end

  # GET /posts/1/edit
  def edit
    if @post.verified?
      redirect_back fallback_location: :my_posts
    else
      unless @post.upload
        @post.build_upload
      end
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @board = Board.find(params[:board_id])
    @post = @board.posts.new(post_params)
    session[:code] = @post.include_owner(@owner).code

    respond_to do |format|
      if @post.save
        Owner.email_admins verify_posts_url
        format.html { redirect_to my_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to board_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to my_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @board = Board.find(params[:board_id])
      @post = @board.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :owner_code, :owner_email, :verified, :board_id,
                                   upload_attributes: [:image])
    end
end
