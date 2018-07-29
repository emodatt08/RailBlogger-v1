class PostsController < ApplicationController
    http_basic_authenticate_with name: "sadat", password: "foolishguy", except: [:index, :show]
   def index
       @posts = Post.all

       end
   
   
    def new
        @post = Post.new
    end
    

    def create
        #render plain: params[:posts].inspect
        @post = Post.new(post_params)
        if (@post.save)
            redirect_to @post
        else
            render 'new'
        end        
    end
    
    def show
        @posts = Post.find(params[:id])
    end
    
    def edit
        @post = Post.find(params[:id])
    end

     def update
        @posts = Post.find(params[:id])
       if(@posts.update(post_params))
            render 'show'
       else
           render 'edit' 
       end    
     end


     def destroy
         @post = Post.find(params[:id])
         @post.destroy
         redirect_to posts_path
         end
    private def post_params
    params.require(:posts).permit(:title, :body)
    end





end
