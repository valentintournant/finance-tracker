class AddBeforePriceToStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :before_price, :decimal
  end
end
