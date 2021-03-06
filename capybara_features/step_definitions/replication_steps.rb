When /^I make sure that the Replication Configuration request succeeds$/ do
  RSpec::Mocks.proxy_for(Net::HTTP).reset
  Net::HTTP.should_receive(:post_form).any_number_of_times do |*args|
    double :body => { "target" => "http://localhost:1234", "databases" => {} }.to_json, :code_type => 200
  end
end

When /^I make sure that the Replication Configuration request fails$/ do
  RSpec::Mocks.proxy_for(Net::HTTP).reset
  Net::HTTP.should_receive(:post_form).any_number_of_times.and_raise("some http error")
end

When /^I clear the Replication Configuration expectations$/ do
  RSpec::Mocks.proxy_for(Net::HTTP).reset
end
