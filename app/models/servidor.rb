class Servidor < ApplicationRecord
	has_many :equipamentos, :through => :termo_compromisso

	def self.search(search)
	    if search
	      where(['siape LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
