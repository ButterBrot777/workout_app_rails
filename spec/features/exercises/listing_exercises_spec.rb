# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Listing Exercises' do
  before do
    @john = User.create!(email: 'john@snow.com', password: '123456')
    login_as(@john)

    @exercise1 = @john.exercises.create!(duration_in_min: 20,
                                         workout: 'My body building activity',
                                         workout_date: Date.today)

    @exercise2 = @john.exercises.create!(duration_in_min: 50,
                                         workout: 'Weight lifting',
                                         workout_date: 2.days.ago)
  end

  scenario "shows user's workout for last 7 days" do
    visit '/'
    click_link 'My Lounge'

    expect(page).to have_content(@exercise1.duration_in_min)
    expect(page).to have_content(@exercise1.workout)
    expect(page).to have_content(@exercise1.workout_date)

    expect(page).to have_content(@exercise2.duration_in_min)
    expect(page).to have_content(@exercise2.workout)
    expect(page).to have_content(@exercise2.workout_date)

    # expect(page).not_to have_content(@exercise3&.duration_in_min)
    # expect(page).not_to have_content(@exercise3&.workout)
    # expect(page).not_to have_content(@exercise3&.workout_date)
  end

  scenario 'shows no exercises if none present' do
    @john.exercises.delete_all
    visit '/'
    click_link 'My Lounge'

    expect(page).to have_content('No Workouts Yet')
  end
end
# rubocop:enable Metrics/BlockLength
