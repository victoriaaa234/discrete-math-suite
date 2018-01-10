# Given /^I am on the home page/ do
#     visit root_path
# end

When /^I click Logic/ do
    click_link('logic')
end

Then /^I am on the Logic page$/ do
    # expect(page.current_url)
    expect(page).to have_current_path(logic_url, url: true)
end