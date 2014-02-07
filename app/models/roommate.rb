class Roommate < ActiveRecord::Base
=begin
	belongs_to :schedule
	has_many :tasks, dependent: :destroy

	accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
=end
end
