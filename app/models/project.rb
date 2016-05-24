class Project < ActiveRecord::Base
	has_many :members, through: :projectusers
	 has_many :tasks, :dependent => :destroy
	 has_many :invoices, :dependent => :destroy
	 has_many :projectusers, :dependent => :destroy
	 accepts_nested_attributes_for :projectusers
	 validates :name, presence: true
	 validates :description, presence: true
	 validates :start_date, presence: true
	 validates :end_date, presence: true
	 # validates :member_ids, presence: true
	 validate :validate_start_date
	
	 def validate_start_date
	  errors.add(:start_date,'Start date should be less than end date!!') if self.start_date > self.end_date 
	 end
end
