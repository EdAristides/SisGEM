class Modelos::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = Modelo.find(params[:modelo_id])
		end
end