class Modelo < ApplicationRecord
	has_many :equipamentos, dependent: :restrict_with_exception

	def self.search(search)
	    if search
	      where(['marca LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
