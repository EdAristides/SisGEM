class Manutencaos::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = Manutencao.find(params[:manutencao_id])
		end
end