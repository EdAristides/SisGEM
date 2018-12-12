class Servidor < ApplicationRecord
	has_many :equipamentos, :through => :termo_compromisso
	has_many :termo_compromisso, dependent: :restrict_with_exception

	def self.search(search)
	    if search
	      where(['siape LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end

  	def nome_e_siape
    	"#{nome} : #{siape}"
  	end
end
