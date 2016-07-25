class Api::V1::PostsController < Api::V1::BaseController
    before_action :authenticate_user, except: [:index, :show]
    before_action :authorize_user, except: [:index, :show]
    
    def index
        posts = Post.all
        render json: posts, status: 200
    end
    
    def show
        post = Post.find(params[:id])
        comments = post.comments.all
        render json: post, status: 200
        render json: comments, status: 200
    end
end