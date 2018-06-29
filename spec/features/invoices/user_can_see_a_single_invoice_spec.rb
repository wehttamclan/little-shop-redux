require 'spec_helper'

describe 'User' do
  describe 'visits invoices/show page' do
    it 'should see a single invoices' do
      invoice = Invoice.create(merchant_id: 1,
                               status: 'something')
      merchant_id = invoice.merchant_id
      status = invoice.status

      visit("/invoices/#{invoice.id}")

      expect(page).to have_content(merchant_id)
      expect(page).to have_content(status)
    end
  end
end
