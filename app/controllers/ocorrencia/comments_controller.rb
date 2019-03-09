class Ocorrencia::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = Ocorrencium.find(params[:ocorrencium_id])
		end
end