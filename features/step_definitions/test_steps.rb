Capybera.default_driver = :chrome

Given /^We navigate to the home page/ do
    visit root_path
end

When /^We click on induction/ do 
    click_link('induction')
end
    