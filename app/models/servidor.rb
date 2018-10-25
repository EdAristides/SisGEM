class Servidor < ApplicationRecord
	def self.search(search)
	    if search
	      where(['siape LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
