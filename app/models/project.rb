class Project < ApplicationRecord

  acts_as_paranoid
  validates :name, presence: true

  belongs_to :user

  has_many :user_projects
  has_many :users, through: :user_projects

  has_many :buggs, dependent: :destroy
end
