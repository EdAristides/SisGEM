class EstoquePeca < ApplicationRecord
	belongs_to :equipamento
	belongs_to :peca
	has_many :comments, as: :commentable
end
