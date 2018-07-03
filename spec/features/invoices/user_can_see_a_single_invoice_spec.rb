require 'spec_helper'

describe 'User' do
  describe 'visits invoices/show page' do
    it 'should see a single invoices' do
      merchant = Merchant.create!(name: 'hi')
      invoice = merchant.invoices.create!(status: 'Pending')
      item1 = Item.create(title: 'brush',
                          merchant_id: merchant.id,
                          description: 'bristles',
                          price: 4,
                          image: 'www.brushpic.com')
      invoice_item = InvoiceItem.create(item_id: item1.id,
                                        quantity: 1,
                                        unit_price: 23,
                                        invoice_id: invoice.id)
                               
      merchant_id = invoice.merchant_id
      status = invoice.status

      visit("/invoices/#{invoice.id}")

      expect(page).to have_content(merchant_id)
      expect(page).to have_content(status)
    end
  end
end
