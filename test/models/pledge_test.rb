require_relative '../test_helper'

class PledgeTest < ActiveSupport::TestCase

  test 'A pledge can be created' do
    pledge1 = build(:pledge, dollar_amount: 99.00, project: new_project)
    pledge1.user = User.new
    assert pledge1.valid?
  end

test 'owner cannot back own project' do
    owner = new_user
    owner.save
    project = new_project
    project.owner = owner
    project.save
    pledge1 = build(:pledge, dollar_amount: 3.00, project: project, user: owner)
    assert pledge1.invalid?, 'Owner should not be able to pledge towards own project'
  end


  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

  def new_user
    User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@example.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end



end
