class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        redirect_to comment.rock #need to redirect to show
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :rock_id, user_attributes:[:name, :password])
    end
end