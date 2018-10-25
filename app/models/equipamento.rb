class Equipamento < ApplicationRecord
	belongs_to :modelo

	def self.search(search)
	    if search
	      where(['patrimonio LIKE ?', "%#{search}%"])
	    else
	      all
	    end
  	end
end
