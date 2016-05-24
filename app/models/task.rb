class Task < ActiveRecord::Base
	belongs_to :projects
	belongs_to :users
	has_one :invoice, :dependent => :destroy
	validates :name, presence: true
	validates :description, presence: true
	validates :user_id, presence: true
end
