# frozen_string_literal: true

RSpec.feature 'Hiding signin link' do
  before do
    @john = User.create!(email: 'john@snow.com', password: '123456')
  end

  scenario 'has content' do
    visit '/'

    click_link 'Sign in'
    fill_in 'Email', with: @john.email
    fill_in 'Password', with: @john.password
    click_button 'Log in'

    expect(page).to have_link('Sign out')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end
