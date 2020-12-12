class AddInvoiceRefToTransations < ActiveRecord::Migration[5.2]
  def change
    add_reference :transations, :invoice, foreign_key: true
  end
end
