class Peca < ApplicationRecord
	has_many :estoque_pecas
	has_many :equipamentos, :through => :estoque_pecas

	def self.search(search)
	    if search
	      where(['nome LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
