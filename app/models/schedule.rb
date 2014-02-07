class Schedule < ActiveRecord::Base

=begin
	has_many :roommates, dependent: :destroy
	accepts_nested_attributes_for :roommates, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
=end
end
