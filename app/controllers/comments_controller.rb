class CommentsController < ApplicationController
	before_filter :authenticate_user!
	def create
		@article = Article.find(params[:article_id])
		
		@comment = @article.comments.create(comment_params)

		redirect_to article_path(@article)
	end

	private
		def comments_params
			params.require(:comment).permit(:commenter, :body)
	end
end
