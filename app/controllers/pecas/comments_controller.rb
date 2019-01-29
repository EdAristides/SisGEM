class Pecas::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = Peca.find(params[:peca_id])
		end
end