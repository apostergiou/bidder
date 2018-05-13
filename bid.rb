require 'json'

class Bid
  def initialize(json)
    @bid = JSON.parse(json, object_class: OpenStruct)
  end

  def country
    @bid.device.geo.country
  end

  def create(campaign)
    {
      id: @bid.id,
      bid: {
        campaignId: campaign.id,
        price: campaign.price,
        adm: campaign.adm
      }
    }
  end
end
