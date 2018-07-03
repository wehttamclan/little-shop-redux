require 'spec_helper'

describe 'User' do
  describe 'visits invoices show page' do
    it 'should see quantity of each item' do
      merchant = Merchant.create!(name: 'hi')
      invoice = merchant.invoices.create!(status: 'Pending')
      item = Item.create(title: 'brush',
                         merchant_id: merchant.id,
                         description: 'bristles',
                         price: 4,
                        image: 'www.brushpic.com')
      invoice_item = InvoiceItem.create(item_id: item.id,
                         quantity: 1,
                         unit_price: 23,
                         invoice_id: invoice.id)

      expected_quantity = invoice_item.quantity

      visit("/invoices/#{invoice.id}")

      expect(page).to have_content(expected_quantity)
    end

    it 'should see unit_price of each item' do
      merchant = Merchant.create!(name: 'hi')
      invoice = merchant.invoices.create!(status: 'Pending')
      item = Item.create(title: 'brush',
                         merchant_id: merchant.id,
                         description: 'bristles',
                         price: 4,
                        image: 'www.brushpic.com')
      invoice_item = InvoiceItem.create(item_id: item.id,
                         quantity: 1,
                         unit_price: 23,
                         invoice_id: invoice.id)

      expected_unit_price = invoice_item.unit_price

      visit("/invoices/#{invoice.id}")

      expect(page).to have_content(expected_unit_price)
    end

    it 'should see total_price of invoice' do
      merchant = Merchant.create!(name: 'hi')
      invoice = merchant.invoices.create!(status: 'Pending')
      item = Item.create(title: 'brush',
                         merchant_id: merchant.id,
                         description: 'bristles',
                         price: 4,
                        image: 'www.brushpic.com')
      InvoiceItem.create(item_id: item.id,
                         quantity: 1,
                         unit_price: 23,
                         invoice_id: invoice.id)

      expected = (invoice.total_price) / 100.0

      visit("/invoices/#{invoice.id}")

      expect(page).to have_content(expected)
    end
  end
end
