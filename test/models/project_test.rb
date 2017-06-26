require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    owner = build(:user, first_name: 'Sally', last_name: 'Lowenthal', email: 'sally@example.com', password:'passpass', password_confirmation: 'passpass')
    # owner.save

    project = build(:project, title: 'Cool new boardgame', description: 'Trade sheep', start_date:  Date.today, end_date: Date.today + 1.month, goal: 50000)
    project.owner = owner
    project.save

    assert project.valid?
    assert project.persisted?
    assert project.owner
  end

  test 'project is invalid without owner' do
    project = build(:project, title: 'Cool new boardgame', description: 'Trade sheep', start_date:  Date.today, end_date: Date.today + 1.month, goal: 50000)

    project.owner = nil
    # project.save
    assert project.invalid?, 'Project should not save without owner.'
  end

end
