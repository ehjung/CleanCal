class Roommate < ActiveRecord::Base

	before_save :set_default_name

	def set_default_name
		if name.nil?
			name = 'Anon'
			errors.add(name, 'Must enter a name.')
		end
	end

end
