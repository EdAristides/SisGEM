class Manutencao < ApplicationRecord
	belongs_to :equipamento
	has_many :comments, as: :commentable

	def self.search(search)
	    if search
	      where(['"numOrdem" LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
