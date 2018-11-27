class TermoCompromisso < ApplicationRecord
	belongs_to :equipamento
	belongs_to :servidor
	has_many :ocorrenciums

	validates :equipamento, presence: true
  	validates :servidor, presence: true

	def self.search(search)
	    if search
	      where(['"numTermo" LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
