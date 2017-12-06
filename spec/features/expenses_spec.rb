require "rails_helper"

RSpec.feature "Expenses", :type => :feature do
=begin
  scenario "User creates a new Expense" do
    visit "/expenses"
    
    click_button "Nuevo Gasto"
    
    click_button "Guardar"

    expect(page).to have_text("Mis Gastos")
  end
=end
  scenario "User filter by date" do
    visit "/expenses"
    within '#month_selector' do

      all('#month_selector option')[1].select_option
      
      all('#month_selector option')[0].select_option
      
      expected = "/expenses?utf8=✓&month=#{Time.now.month}&year=#{Time.now.year}&transaction_type_id=&category_id="
      expect(page).to have_current_path(expected, url: false)
    end
  end
  scenario "User filter by transaction type" do
    visit "/expenses"      
    choose('transaction_type_id1', allow_label_click: true) # find by id and select by clicking the label if input is non-visible
      expected = "/expenses?utf8=✓&month=#{Time.now.month}&year=#{Time.now.year}&transaction_type_id=1&category_id="    
      expect(page).to have_current_path(expected, url: false)      
  end
  scenario "User filter by category_type type" do
    visit "/expenses"      
    choose('category_id_1', allow_label_click: true) # find by id and select by clicking the label if input is non-visible
      expected = "/expenses?utf8=✓&month=#{Time.now.month}&year=#{Time.now.year}&transaction_type_id=&category_id=1"    
      expect(page).to have_current_path(expected, url: false)      
  end
end