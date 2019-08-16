require 'rails_helper'

Factory.define do
  factory :user do
    username {"test_user_rspec"}
    email {"test_user@testing.com"}
    password{"testpassword"}
  end
end
