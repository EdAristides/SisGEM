class Ocorrencium < ApplicationRecord
	belongs_to :termo_compromisso
	has_many :comments, as: :commentable
end
