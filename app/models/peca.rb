class Peca < ApplicationRecord
	def self.search(search)
	    if search
	      where(['nome LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
