require_relative 'web/web_methods'

Given(/^I am on "([^\"]*)"$/)do |link|
  visit(link)
end

When(/^I click on element having (.+) "(.*?)"$/) do |type, access_name|
  validate_locator type
  click(type, access_name)
end

Then(/^link having text "(.*?)" should\s*((?:not)?)\s+be present$/) do |access_name, present|
  check_element_on_page('link', access_name, present.empty?)
end
