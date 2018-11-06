class TermoCompromisso < ApplicationRecord
	belongs_to :equipamento
	belongs_to :servidor
	has_many :ocorrenciums

	def self.search(search)
	    if search
	      where(['"numTermo" LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
