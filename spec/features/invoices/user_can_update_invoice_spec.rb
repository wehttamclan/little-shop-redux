require 'spec_helper'

describe 'User' do
  describe 'visits /invoices/:id/edit' do
    it 'should see a form and update invoice status' do
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

      visit "/invoices/#{invoice.id}/edit"

      select('Pending')

      click_button 'Update Invoice'

      expect(page).to have_content('Pending')

      expect(current_path).to eq("/invoices/#{invoice.id}")
    end
  end
end
