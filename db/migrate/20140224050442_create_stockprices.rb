class CreateStockprices < ActiveRecord::Migration
  def change
    create_table :stockprices do |t|

      t.timestamps
    end
  end
end
