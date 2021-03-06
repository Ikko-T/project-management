class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates :status, inclusion: { within: %w(not_started on_going complete) }

  enum status: {
    not_started: 0,
    on_going: 1,
    complete: 2,
  }

  def badge_color
    case status
    when 'not_started'
      'secondary'
    when 'on_going'
      'info'
    when 'complete'
      'success'
    end
  end

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'on_going'
  end

  def not_started?
    status == 'not_started'
  end
end
