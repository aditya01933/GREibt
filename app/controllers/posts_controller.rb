class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user
  before_filter :has_userdetail_and_topic, :only =>[:new, :create]



  # GET /posts
  # GET /posts.json

  #for new association SAAS book

  protected
  def has_userdetail_and_topic

    unless(@topic =Topic.find_by_id(params[:topic_id]))
      flash[:warning] = 'post must be for an existing topic'
    end
  end

  public

  def new
    @post = @topic.posts.build

    #@@topic = Topic.find(params[:topic_id1])

  end

  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create

    @post = @topic.posts.build(post_params)
    current_user.posts << @post
    @initial = 0
    @post.rating = @initial


    #current_user.posts << @topic.posts.build(params[post_params])

    #@topic.posts << @post

    #@post = Post.new(post_params )

    #@post.userdetail_id = current_user.id

     #Association functional between topic and post
     #Class variable used
     #@@topic.posts << @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@topic, @post], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def voteup
    @post.rating = @initial+1
  end  

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
      format.html { redirect_to [@topic, @post], notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:topic_id,:issue, :description, :rating, :user_id )
    end
end
