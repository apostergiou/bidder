require 'rack/test'
require 'webmock/rspec'
require 'support/fake_campaigns.rb'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each) do
    stub_request(:any, /campaigns.apiblueprint.org/).to_rack(FakeCampaigns)
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end
