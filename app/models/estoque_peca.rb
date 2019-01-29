class EstoquePeca < ApplicationRecord
	belongs_to :equipamento
	belongs_to :peca
end
