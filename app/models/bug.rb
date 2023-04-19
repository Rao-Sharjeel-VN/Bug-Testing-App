class Bug < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true
  validates :bug_type, presence: true
  validates :project_id, presence: true
  # mount uploader :image, AvatarUploader

  validates_uniqueness_of :title, scope: :project_id

  belongs_to :project, foreign_key: 'project_id'
  belongs_to :qa, class_name: "User", foreign_key: 'qa_id'
  # belongs_to :dev, class_name: "User", foreign_key: 'dev_id', optional: true
end
