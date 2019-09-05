class CommentsController < ApplicationController
    before_action :to_already_logged_in?

    def create
        @comment = Comment.create(comment_params)
        redirect_to rock_path(@comment)
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:name])
    end
end