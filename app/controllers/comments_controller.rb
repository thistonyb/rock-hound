class CommentsController < ApplicationController
#Create comment with strong params
    def create
        comment = Comment.create(comment_params)
        redirect_to comment.rock #need to redirect to show
    end
#Set up strong params
    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :rock_id, user_attributes:[:name, :password, :password_confirmation])
    end
end