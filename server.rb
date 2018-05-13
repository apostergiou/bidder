require 'net/http'
require 'sinatra'
require_relative 'bid'
require_relative 'campaigns'
require_relative 'broker'

class Bidder < Sinatra::Base
  CAMPAIGNS_URI = 'http://campaigns.apiblueprint.org/campaigns'

  post '/bid' do
    req_bid = Bid.new(request.body.read)
    campaigns = Campaigns.new(get_campaigns)
    res_bid = Broker.new(campaigns, req_bid).work

    if res_bid.nil?
      [204, {}, '']
    else
      [200, { 'Content-Type': 'application/json' }, res_bid.to_json]
    end
  end

  private

  def get_campaigns
    Net::HTTP.get(URI(CAMPAIGNS_URI))
  end
end
