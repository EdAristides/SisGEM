class TermoCompromisso < ApplicationRecord
	belongs_to :equipamento
	belongs_to :servidor

	def self.search(search)
	    if search
	      where(['"numTermo" LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
