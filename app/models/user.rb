class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :user_projects
  has_many :assigned_projects, :through => :user_projects, :source => :project

  has_many :qa_buggs, class_name: "Bugg", foreign_key: 'id'
  has_many :solved_buggs, class_name: "Bugg", foreign_key: 'id'

end
