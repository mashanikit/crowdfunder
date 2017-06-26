class CommentsController < ApplicationController

    def new
      @comment = Product.find(params[:product_id]).comments.new
    end



    def create
      @project = Project.find(params[:project_id])
      @comment = @project.comments.create(comment_params)
      if @comment.save
        flash[:notice] = "Your comment has been saved"
        redirect_to projects_path
      else
        render '/projects/show'
      end
    end

    def edit
      @project = Project.find(params[:project_id])
      @comment = Comment.find(params[:id])
    end

    def update
      @comment = Comment.find(params[:project_id])
      if @project.comments.update(review_params)
        flash[:notice] = "Your comment has been updated"
        redirect_to projects_path(:project_id)
      else
        redirect_back_or_to @comment
      end
    end


    def destroy
      @project = Project.find(params[:product_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:alert] = "Your comment has been deleted"
      redirect_to projects_path(:project_id)
    end

    private

    def comment_params
      params.required(:comment).permit(:input)
    end

end
