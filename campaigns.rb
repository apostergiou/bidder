class Campaigns
  def initialize(json)
    @campaigns_collection = JSON.parse(json, object_class: OpenStruct)
  end

  def find_by(key, value)
    @campaigns_collection.select { |c| eval("c.#{key}").include?(value) }
  end

  def best_price(campaigns)
    campaigns.sort_by(&:price).reverse.first
  end
end
