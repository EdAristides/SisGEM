class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:destroy]

	def create
		@comment = @commentable.comments.new comment_params
		@comment.user = current_user
		@comment.save
		redirect_to @commentable, notice: "Comentário efetuado com sucesso!"
	end

	def destroy
   		comment = Comment.find(params[:id])
    	comment.destroy
    	redirect_back fallback_location: { action: "show" }, notice: "Comentário apagado com sucesso!"
 	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end