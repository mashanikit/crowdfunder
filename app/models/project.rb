class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :owner, :title, :description, :goal, :start_date, :end_date, presence: true
  validates :goal, numericality: { greater_than: 0 }
  validate :start_date_not_in_past, :end_date_after_start_date

  def start_date_not_in_past
    if start_date < Date.today
      errors.add(:start_date, "The start date can not be in the past")
    end
  end

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "The project end date must be later than its start date")
    end
  end

end
