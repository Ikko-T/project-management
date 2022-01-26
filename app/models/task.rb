class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
end
