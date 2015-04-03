require 'net/https'
require_relative 'required_files'

WAIT = Selenium::WebDriver::Wait.new(:timeout => 30)


class Failure < Exception
end

def visit(page)
  $driver.get(page)
end

def valid_locator_type? type
  %w(id class css name xpath).include? type
end

def validate_locator type
  raise "Invalid locator type - #{type}" unless valid_locator_type? type
end

def click(locator_type, locator_name)
  WAIT.until { $driver.find_element(:"#{locator_type}" => "#{locator_name}") }.click
end

def displayed(locator_type, locator_name)
  WAIT.until{ $driver.find_element(:"#{locator_type}" => "#{locator_name}") }.displayed?
end

def check_element_on_page(locator_type, locator_name, scenario)
  if scenario
    if !displayed(locator_type, locator_name)
      raise Failure, 'Element Not Present'
    end
  else
    begin
      if displayed(locator_type, locator_name)
        raise 'Present'
      end
    rescue Exception => e
      if e.message == 'Present'
        raise Failure, 'Element Present'
      end
    end
  end
end
