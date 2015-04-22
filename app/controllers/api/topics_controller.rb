module API	
	class TopicsController < API::ApibaseController
	after_action :allow_iframe

 



  
		skip_before_filter :authenticate_support_user!
		def index	
			topics = Topic.all	
			if id = params[:id]
				topic = topics.where(id: id)
			end	
			render json: topics, status: 200
		end	

		def show	
			topic = Topic.find(params[:id])	
			render json: topic, status: 200	
		end	

		def create	
			
			topic = Topic.new(topic_params)	
			if topic.save	
				render json: topic, status: 201, location: topic	
			end	
				
		end

		def update	
			topic = Topic.find(params[:id])	
			if topic.update(topic_params)	
				render json: topic, status: 200	
			end	
		end	

		def destroy	
			topic = Topic.find(params[:id])	
			topic.destroy	
			head 204	

		end	
					
    private	
    def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
		def topic_params	
		params.require(:topic).permit(:issue)	
		end

	end	
end