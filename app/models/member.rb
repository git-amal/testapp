class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  enum role: [:client,:team_lead,:team_member,:project_manager,:admin]

  after_initialize :set_default_role
  has_many :projects, through: :projectusers
  has_many :tasks
  has_many :invoices
  has_many :projectusers, :dependent => :destroy
  validates :username, presence: true
  validates :email, presence: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  validates :role, presence: true

  def set_default_role
    self.role ||= :client
  end

end
