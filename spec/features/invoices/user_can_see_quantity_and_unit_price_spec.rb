require 'spec_helper'

describe 'User' do
  describe 'visits invoices show page' do
    it 'should see quantity of each item' do
      test_invoice = Invoice.create(merchant_id: 1,
                                    status: 'pending')

      test_invoice_item = InvoiceItem.create(item_id: 24355,
                                             invoice_id: 1,
                                             quantity: 3,
                                             unit_price: 44)

      expected_quantity = test_invoice_item.quantity

      visit("/invoices/#{test_invoice.id}")

      expect(page).to have_content(expected_quantity)
    end

    it 'should see unit_price of each item' do
      test_invoice = Invoice.create(merchant_id: 1,
                                    status: 'pending')

      test_invoice_item = InvoiceItem.create(item_id: 24355,
                                             invoice_id: 1,
                                             quantity: 3,
                                             unit_price: 44)

      expected_unit_price = test_invoice_item.unit_price

      visit("/invoices/#{test_invoice.id}")

      expect(page).to have_content(expected_unit_price)
    end
  end
end
