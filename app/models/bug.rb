class Bug < ApplicationRecord
    validates :title, presence: true
    validates :status, presence: true
    validates :bug_type, presence: true
    validates :project_id, presence: true
    
    validates_uniqueness_of :title, scope: :project_id

    belongs_to :project
    belongs_to :qa, class_name: "User"
    belongs_to :dev, class_name: "User", optional: true

end
