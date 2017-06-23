class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :dollar_amount, presence: true
  validates :user, presence: true
  validate :owner_cannot_pledge_own

  def owner_cannot_pledge_own
    if self.user == project.owner
      errors.add(:user, 'You cannot back your own project')
    end
  end

end
