class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
 
  # GET /quizzes
  
  # GET /quizzes.json
  


  
  def next2(t)     
     @start1 = t     
     return @start1     
   end
 

  def index 
    
     @start = params[:start].to_i||0 
     @quizzes = Quiz.offset(@start).take(5)
     #@quizzes = Quiz.where(:id => @start..@start+4)
       #  @quizzes = Quiz.all
     

  end
 
  
  def check
    
    question = Quiz.find(params[:id])    
    answer = params[:interest] 
    
   
    

    if answer == question.answer
      redirect_to :back
       
      #marking
      # frame_marks1(t+1)

      current_marks = Score.find_by_user_id(current_user).marks
      plus_one = current_marks +1 
      current_user.score.update(marks: plus_one)
     
      flash[:notice] = "correct answer#{current_marks+1}"

      
    else
      redirect_to :back
      flash[:notice] = "incorrect answer" 
    end  
    
    #for sidewindow
    #print_number
  end



  # def marks (current_marks)
  #   current_marks = current_marks + 1
  # end


   

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:user_id, :question, :option1, :option2, :option3, :option4, :answer)
    end
end
