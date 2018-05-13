# Bidder

Bidder is simply a platform which allows advertisers to submit bids to buy
mobile ad space in real-time. A bidder receives bid requests from 3rd-party ad
exchanges and responds back with a bid response. This bid then competes with
bids from other bidders in a real-time auction at the exchange. The highest bid
(in terms of bid price) wins and gets to show its ad.

- Bidder receives and parses a bid request from an ad exchange.
- Bidder retrieves all the available campaigns from its campaign pool.
- Bidder filters out campaigns that do not match the targeting criteria.
- If there are matching campaigns then the bidder finds the highest paying campaign and submits a bid for that campaign to the ad exchange.
- Otherwise the bidder submits an empty response with no bid.

## Requirements

- Ruby 2.3+
- Bundler

## Installation

Execute:

```shell
$ bundle
```

## Testing

Execute:

```shell
$ rspec
```

## Usage

TODO
