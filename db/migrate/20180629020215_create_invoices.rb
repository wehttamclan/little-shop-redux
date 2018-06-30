class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :merchant_id
      t.text    :status

      t.timestamps null: false
    end
  end
end
