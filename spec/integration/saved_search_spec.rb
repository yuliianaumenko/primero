require 'spec_helper'

feature "saved search" do
  before do
    @form_section = create(:form_section,
      is_first_tab: true,
      fields: [
        build(:subform_field, initial_subforms: 2, fields: [
          build(:field, required: true),
          build(:field)
        ])
      ]
    )

    @user = setup_user(form_sections: [@form_section])
    create_session(@user, 'password123')
  end

  scenario "should see saved searches tab and save button" do
    visit '/cases'
    expect(page).to have_selector('#saved-searches-label')
    expect(page).to have_selector('.button.save_search')
  end

  scenario "should not be able to save search if there is no name" do
    visit '/cases'
    check('flag_flag')
    check('marked_for_mobile_true')
    find('.button.save_search').click
    expect(find('.button.save_user_filters')[:disabled])
  end

  scenario "should be able to save search, see it in saved searches tab" do
    visit '/cases'
    check('flag_flag')
    check('marked_for_mobile_true')
    find('.button.save_search').click
    find('#save_filters input').set('saved search')
    find('.button.save_user_filters').click
    find('#saved-searches-label').click
    page.save_screenshot('screenshot1.png')
    expect(page).to have_selector('.user_filter')
  end

  # TODO: add testing for deleting once headless chromedriver supports interacting with system dialogs
end