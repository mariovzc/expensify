require "rails_helper"

RSpec.feature "Expenses", :type => :feature do
  scenario "User filter by date" do
    visit "/expenses"
    within '#month_selector' do

      all('#month_selector option')[1].select_option
      
      all('#month_selector option')[0].select_option
      
      expected = "/expenses?utf8=✓&month=#{Time.now.month}&year=#{Time.now.year}&transaction_type_id=&category_id="
      expect(page).to have_current_path(expected, url: false)
    end
  end
end