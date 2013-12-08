include ApplicationHelper

def valid_signin(user)
  visit signin_path
  fill_in_signin(user)
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def valid_information(name, email, password)
  fill_in "Name",     with: name
  fill_in "Email",    with: email
  fill_in "Password", with: password
  fill_in "Confirm Password", with: password
end

def fill_in_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

