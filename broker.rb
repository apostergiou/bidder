class Broker
  def initialize(campaigns, bid)
    @bid = bid
    @campaigns = campaigns
  end

  def work
    targets = @campaigns.find_by(:targetedCountries, @bid.country)
    return nil if targets.empty?
    @bid.create(@campaigns.best_price(targets))
  end
end
