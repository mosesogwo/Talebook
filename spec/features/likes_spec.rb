# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes' do
  scenario 'liking and unliking a post' do
    register_user('uac5@gmail.com')
    create_post
    click_on('💟0', match: :first)
    expect(page).to have_content('💗1')
    click_on('💗1', match: :first)
    expect(page).to have_content('💟0')
  end

  scenario 'liking a comment' do
    visit posts_path
    sign_in_user('uac5@gmail.com')
    comment_post
    within('.comment', match: :first) { click_on '💟0' }
    within('.comment', match: :first) { expect(page).to have_content('💗1') }
    within('.comment', match: :first) { click_on '💗1' }
    within('.comment', match: :first) { expect(page).to have_content('💟0') }
  end
end
