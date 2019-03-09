class Modelo < ApplicationRecord
	has_many :equipamentos, dependent: :restrict_with_exception
	has_many :comments, as: :commentable

	def self.search(search)
	    if search
	      where(['marca LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
