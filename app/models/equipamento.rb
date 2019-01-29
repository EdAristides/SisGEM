class Equipamento < ApplicationRecord
	belongs_to :modelo
	has_many :estoque_pecas, dependent: :restrict_with_exception
	has_many :pecas, :through => :estoque_pecas
	has_many :manutencaos
	has_many :servidors, :through => :termo_compromisso
	has_many :termo_compromisso, dependent: :restrict_with_exception

	def self.search(search)
	    if search
	      where(['patrimonio LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end

  	def self.notebook_disponivel
  		# Buscar equipamentos disponíveis que o tipo do modelo seja um notebook
		joins(:modelo).where(:modelos => {tipo: 'Notebook'}, status: 'Disponível')
  	end

  	def self.tablet_disponivel
		joins(:modelo).where(:modelos => {tipo: 'Tablet'}, status: 'Disponível')
  	end
end
