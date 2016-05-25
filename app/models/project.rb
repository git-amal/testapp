class Project < ActiveRecord::Base

	 enum status: [:open,:completed,:approve,:reject]

  	 after_initialize :set_default_status
	 has_many :members, through: :projectusers
	 has_many :tasks, :dependent => :destroy
	 has_many :invoices, :dependent => :destroy
	 has_many :projectusers, :dependent => :destroy
	 accepts_nested_attributes_for :projectusers
	 validate :validate_start_date
	 validates :name, presence: true
	 validates :description, presence: true
	 validates :start_date, presence: true
	 validates :end_date, presence: true
	 validates :member_ids, presence: true
	 

	 def set_default_status
	    self.status ||= :open
	 end

	def validate_start_date
	  errors.add(:start_date,'Start date should be less than end date!!') if self.start_date >= self.end_date 
	end
end
