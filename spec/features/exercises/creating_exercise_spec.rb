# frozen_string_literal: true

RSpec.feature 'Creating Exercise' do
  before do
    @john = User.create!(email: 'john@snow.com', password: '123456')
    login_as(@john)
  end

  scenario 'with valid inputs' do
    visit '/'
    click_link 'My Lounge'
    click_link 'New Workout'

    expect(page).to have_link('Back')

    fill_in 'Duration', with: 70
    fill_in 'Workout Details', with: 'Weight lifting'
    fill_in 'Activity date', with: '2016-07-26'
    click_button 'Create Exercise'

    expect(page).to have_content('Exercise has been created')

    exercise = Exercise.last
    expect(current_path).to eq(user_exercie_path(@john, exercise))
    expect(exercise.user_id).to eq(@john.id)
  end
end
