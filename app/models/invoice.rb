class Invoice < ActiveRecord::Base
	belongs_to :member
	belongs_to :project
	validate :validate_start_date
	validates :name, presence: true
	validates :description, presence: true
	validates :project_id, presence: true
	validates :working_hours, numericality: true
	validates :cost, numericality: true
    validates :created_by, presence: true
    validates :start_date, presence: true
	validates :end_date, presence: true
	

    def validate_start_date
	  errors.add(:start_date,'Start date should be less than end date!!') if self.start_date >= self.end_date 
	end
end
