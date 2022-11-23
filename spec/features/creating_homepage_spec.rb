# frozen_string_literal: true

RSpec.feature 'Created Home Page' do
  scenario 'has content' do
    visit '/'

    expect(page).to have_link('Home')
    expect(page).to have_link('Athletes Den')
    expect(page).to have_content('Workout Lounge!')
    expect(page).to have_content('Show off your workout')
  end
end
