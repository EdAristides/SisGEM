class Manutencao < ApplicationRecord
	belongs_to :equipamento

	def self.search(search)
	    if search
	      where(['"numOrdem" LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
