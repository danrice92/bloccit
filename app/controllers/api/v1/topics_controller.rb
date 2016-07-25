class Api::V1::TopicsController < Api::V1::BaseController
    before_action :authenticate_user, except: [:index, :show]
    before_action :authorize_user, except: [:index, :show]
    
    def index
        topics = Topic.all
        render json: topics, status: 200
    end
    
    def show
        topic = Topic.find(params[:id])
        posts = topic.posts.all
        render json: topic, status: 200
        render json: posts, status: 200
    end
end