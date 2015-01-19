class UserdetailsController < ApplicationController

  before_action :set_userdetail, only: [:show, :edit, :update, :destroy]

  #User can only edit or destroy its own details
  before_action :correct_user, only: [:edit, :update, :destroy]

  #For user association withuserdetails
  before_filter :has_user, only: [:new, :create]

  protected
  def has_user
    unless (@user=User.find_by_id(current_user))
      flash[:warning] = 'Userdetail must be for an existing user'  

    end
  end

  # GET /userdetails
  # GET /userdetails.json

  public

  def index
    @userdetails = Userdetail.all
  end

  # GET /userdetails/1
  # GET /userdetails/1.json
  def show
   
  end

  # GET /userdetails/new
  def new
   @userdetail = Userdetail.new
   
  end

  # GET /userdetails/1/edit
  def edit
  end

  # POST /userdetails
  # POST /userdetails.json
  def create

    @userdetail = Userdetail.new(userdetail_params)

    @user.userdetail= @userdetail
   
    #@userdetail.user_id = current_user.id

    respond_to do |format|
    

      if @userdetail.save
        format.html { redirect_to @userdetail, notice: 'Userdetail was successfully created.' }
        format.json { render :show, status: :created, location: @userdetail }
      else
        format.html { render :new }
        format.json { render json: @userdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userdetails/1
  # PATCH/PUT /userdetails/1.json
  def update
    respond_to do |format|
      if @userdetail.update(userdetail_params)
        format.html { redirect_to @userdetail, notice: 'Userdetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @userdetail }
      else
        format.html { render :edit }
        format.json { render json: @userdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userdetails/1
  # DELETE /userdetails/1.json
  def destroy
    @userdetail.destroy
    respond_to do |format|
      format.html { redirect_to userdetails_url, notice: 'Userdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userdetail
      @userdetail = Userdetail.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userdetail_params
      params.require(:userdetail).permit(:first_name, :last_name, :myuserid, :birthday, :gender, :contact_number, :address, :country, :state, :city, :gre_date)
    end

    def correct_user

      @user = @userdetail.user_id

      redirect_to( userdetails_url) unless @user == current_user.id
    end
end
