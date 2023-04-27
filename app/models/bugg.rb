class Bugg < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true
  validates :bugg_type, presence: true
  validates :project_id, presence: true
  mount_uploader :screenshot, AvatarUploader

  validates_uniqueness_of :title, scope: :project_id

  belongs_to :project, foreign_key: 'project_id'
  belongs_to :qa, class_name: "User", foreign_key: 'qa_id'
  belongs_to :solver, class_name: "User", foreign_key: 'solver_id', optional: true
  
end
