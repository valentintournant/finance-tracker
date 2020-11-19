class Stock < ApplicationRecord
has_many :user_stocks
has_many :users, through: :user_stocks

validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: ENV["SANDBOX_API_KEY"],
                                endpoint: 'https://sandbox.iexapis.com/v1')
  #client.price(ticker_symbol)
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end
  end

  def self.check_db(ticker_symbol)
    find_by(ticker: ticker_symbol)
  end


end
