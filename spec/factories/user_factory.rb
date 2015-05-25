FactoryGirl.define do
  factory :user do
    name "Example user"
    email "user@example.com"
    password "hunter2"
    password_confirmation "hunter2"
  end
end