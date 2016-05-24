class Invoice < ActiveRecord::Base
	belongs_to :member
	belongs_to :project
	validates :name, presence: true
	validates :description, presence: true
	validates :project_id, presence: true
	validates :cost, presence: true
    validates :created_by, presence: true
end
