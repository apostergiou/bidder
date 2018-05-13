require 'spec_helper'
ENV['RACK_ENV'] = 'test'

describe 'find best bid' do
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file('config.ru').first
  end

  let(:request_body) do
    File.open(File.dirname(__FILE__) + '/support/fixtures/' + file_name, 'rb').read
  end

  context 'when there are available campaigns' do
    let(:file_name) { 'success_bid_req.json' }
    let(:expected_status) { 200 }
    let(:expected_body) do
      json = File.open(File.dirname(__FILE__) + '/support/fixtures/' +
                      'success_bid_response.json', 'rb').read
      JSON.parse(json)
    end

    before { post('/bid', request_body, { 'CONTENT_TYPE' => 'application/json' }) }

    it { expect(last_response.status).to eq expected_status }
    it { expect(JSON.parse(last_response.body)).to eq expected_body }
  end

  context 'when there are not any available campaigns' do
    let(:file_name) { 'fail_bid_req.json' }
    let(:expected_status) { 204 }
    let(:expected_body) { '' }

    before { post('/bid', request_body, { 'CONTENT_TYPE' => 'application/json' }) }

    it { expect(last_response.status).to eq expected_status }
    it { expect(last_response.body).to eq expected_body }
  end
end
