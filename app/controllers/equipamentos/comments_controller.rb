class Equipamentos::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = Equipamento.find(params[:equipamento_id])
		end
end