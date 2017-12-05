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
      find("option[value='2017-11-05']").click
      expected = "/expenses?utf8=✓&month=11&year=2017&transaction_type_id=&category_id="
      expect(page).to have_current_path(expected, url: false)      
    end
  end 
end