class QuizzesController < InheritedResources::Base

  private

    def quiz_params
      params.require(:quiz).permit(:user_id, :question, :option1, :option2, :option3, :option4, :answer)
    end
end

