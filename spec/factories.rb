FactoryGirl.define do
  factory :user do
    name      "John Martin"
    email     "jm@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end

