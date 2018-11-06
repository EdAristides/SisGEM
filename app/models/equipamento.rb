class Equipamento < ApplicationRecord
	belongs_to :modelo
	has_many :estoque_pecas
	has_many :pecas, :through => :estoque_pecas
	has_many :manutencaos
	has_many :servidors, :through => :termo_compromisso

	def self.search(search)
	    if search
	      where(['patrimonio LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
