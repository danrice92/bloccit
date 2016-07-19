class TopiccommentsController < ApplicationController
    before_action :require_sign_in
    before_action :authorize_user, only: [:destroy]
    
    def create
        @topic = Topic.find(params[:topic_id])
        topiccomment = @topic.topiccomments.new(topiccomment_params)
        topiccomment.user = current_user
        
        if topiccomment.save
            flash[:notice] = "Comment saved successfully."
            redirect_to [@topic]
        else
            flash[:alert] = "Comment failed to save."
            redirect_to [@topic]
        end
    end
    
    def destroy
        @topic = Topic.find(params[:topic_id])
        topiccomment = @topic.topiccomments.find(params[:id])
        
        if topiccomment.destroy
            flash[:notice] = "Comment was deleted successfully."
            redirect_to [@topic]
        else
            flash[:alert] = "Comment couldn't be deleted. Try again."
            redirect_to [@topic]
        end
    end
    
    private
    
    def topiccomment_params
        params.require(:topiccomment).permit(:body)
    end
    
    def authorize_user
        topiccomment = Topiccomment.find(params[:id])
        unless current_user == topiccomment.user || current_user.admin?
            flash[:alert] = "You do not have permission to delete that comment."
            redirect_to [topiccomment.topic]
        end
    end
end
