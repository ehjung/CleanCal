class Task < ActiveRecord::Base

	serialize :assignedto, Array

end
