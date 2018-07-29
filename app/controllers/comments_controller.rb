class CommentsController < ApplicationController
    http_basic_authenticate_with name: "sadat", password: "foolishguy", only: [:destroy]
    def index 
       
    end

    def new
        @posts = Post.new
        redirect_to post_path
    end
    
    def create
    @posts = Post.find(params[:post_id])
    @comments = @posts.comments.create(comments_params)
    
end


    def destroy
        @posts = Post.find(params[:post_id])
        @comment = @posts.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@posts)

        end

    private def  comments_params
    params.require(:comment).permit(:username, :body)
    end



end
