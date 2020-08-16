# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Post Management' do
  scenario 'create new post' do
    register_user('uac3@gmail.com')
    fill_in 'Tell your tale', with: 'My new post'
    click_button 'Submit'
    expect(page).to have_content('Post successfully created')
  end

  scenario 'edit post' do
    visit posts_path
    sign_in_user('uac3@gmail.com')
    fill_in 'Tell your tale', with: 'a new post'
    click_on '🖉'
    fill_in 'Edit your story', with: 'an updated post'
    click_on 'Post'
    expect(page).to have_content('Post successfully edited')
  end

  scenario 'delete post' do
    visit posts_path
    sign_in_user('uac3@gmail.com')
    fill_in 'Tell your tale', with: 'a new post'
    click_on '❌'
    expect(page).to have_content('Post deleted')
  end
end
