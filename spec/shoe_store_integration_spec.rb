require "capybara/rspec"
require "./app"
require "spec_helper"

describe("describes index path", {:type => :feature}) do

  it("tests that the homepage works'") do
    visit("/")
    expect(page).to(have_content("View Brands"))
  end


  it("tests that the brand page works") do
    visit("/")
    click_link('View Brands')
    expect(page).to(have_content("Add a Brand:"))
  end

  it("tests that the store page works") do
    visit("/")
    click_link('View Stores')
    expect(page).to(have_content("Add a store:"))
  end

  it("tests adding a store'") do
      visit("/")
      click_link('View Stores')
      fill_in('store_name', :with => 'Walmart')
      click_button('Add Store')
      expect(page).to(have_content("Walmart"))
  end
  it("tests adding a brand'") do
    visit("/")
    click_link('View Brands')
    fill_in('brand_name', :with => 'Nike')
    fill_in('price', :with => '200')
    click_button('Add Brand')
    expect(page).to(have_content("Nike"))
  end
end
