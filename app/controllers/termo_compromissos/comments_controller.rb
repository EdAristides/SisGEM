class TermoCompromissos::CommentsController < CommentsController
	before_action :set_commentable

	private
		def set_commentable
			@commentable = TermoCompromisso.find(params[:termo_compromisso_id])
		end
end