class EstoquePecas::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = EstoquePeca.find(params[:estoque_peca_id])
		end
end