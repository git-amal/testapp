class Task < ActiveRecord::Base

	enum status: [:open,:development,:completed]

  	after_initialize :set_default_status
	belongs_to :projects
	belongs_to :users
	# has_one :invoice, :dependent => :destroy
	validates :name, presence: true
	validates :description, presence: true
	validates :member_id, presence: true

	 def set_default_status
	    self.status ||= :open
	 end
end
