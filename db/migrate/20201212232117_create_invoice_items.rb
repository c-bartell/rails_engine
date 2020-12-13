class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    unless ActiveRecord::Base.connection.table_exists?('invoice_items')
      create_table :invoice_items do |t|
        t.integer :quantity
        t.float :unit_price

        t.timestamps
      end
    end
  end
end
