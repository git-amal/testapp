class Projectuser < ActiveRecord::Base
	belongs_to :project
	belongs_to :member
end
