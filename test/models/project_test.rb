require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'valid project can be created' do
    owner = build(:user, first_name: 'Sally', last_name: 'Lowenthal', email: 'sally@example.com', password:'passpass', password_confirmation: 'passpass')

    project = build(:project, title: 'Cool new boardgame', description: 'Trade sheep', start_date:  Date.today, end_date: Date.today + 1.month, goal: 50000)
    project.owner = owner

    assert project.valid?
    assert project.owner
  end

  test 'project is invalid without owner' do
    project = build(:project, title: 'Cool new boardgame', description: 'Trade sheep', start_date:  Date.today, end_date: Date.today + 1.month, goal: 50000)

    project.owner = nil
    # project.save
    assert project.invalid?, 'Project should not save without owner.'
  end


  test 'project is invalid with start date in past' do
    owner = build(:user, first_name: 'Sally', last_name: 'Lowenthal', email: 'sally@example.com', password:'passpass', password_confirmation: 'passpass')
    project = build(:project, title: 'Cool new boardgame', description: 'Trade sheep', start_date:  Date.today - 1.month, end_date: Date.today + 1.month, goal: 50000)

    project.owner = owner

    assert project.invalid?, 'Project should not save with start date in the past'
  end

  test 'project is invalid with end date before start date' do
    owner = build(:user, first_name: 'Sally', last_name: 'Lowenthal', email: 'sally@example.com', password:'passpass', password_confirmation: 'passpass')
    project = build(:project, title: 'Cool new boardgame', description: 'Trade sheep', start_date:  Date.today + 2.month, end_date: Date.today + 1.month, goal: 50000)

    project.owner = owner

    assert project.invalid?, 'Project end date must be after its start date'
  end


end
