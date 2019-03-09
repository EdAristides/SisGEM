class Peca < ApplicationRecord
	has_many :estoque_pecas, dependent: :restrict_with_exception
	has_many :equipamentos, :through => :estoque_pecas
	has_many :comments, as: :commentable

	def self.search(search)
	    if search
	      where(['nome LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
