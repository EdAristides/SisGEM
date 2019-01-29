class Servidors::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = Servidor.find(params[:servidor_id])
		end
end