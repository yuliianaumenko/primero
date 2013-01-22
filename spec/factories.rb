require 'factory_girl'

FactoryGirl.define do
  factory :replication do
    description 'Sample Replication'
    remote_url 'localhost:1234'

    after_build do |replication|
      replication.stub! :remote_config => { "target" => "localhost:5984/replication_test" }
    end
  end

  factory :change_password_form, :class => Forms::ChangePasswordForm do
    association :user
    old_password "old_password"
    new_password "new_password"
    new_password_confirmation "confirm_new_password"
  end

  factory :user do
    user_name { "user_name_#{rand(10000)}" }
    full_name 'full name'
    password 'password'
    password_confirmation 'password'
    email 'email@ddress.net'
    organisation 'TW'
    disabled false
    role_ids ['random_role_id']
  end
end
