class Roommate < ActiveRecord::Base

	def set_default_name
		if name.nil?
			name = 'Anon'
			errors.add(name, 'Must enter a name.')
		end
	end
end
