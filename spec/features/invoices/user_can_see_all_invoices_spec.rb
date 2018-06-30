require 'spec_helper'

describe 'User' do
  describe 'visits invoices index page' do
    it 'should see all invoices' do
      invoice = Invoice.create(merchant_id: 1,
                               status: 'something')
      merchant_id = invoice.merchant_id

      visit('/invoices')

      expect(page).to have_content(merchant_id)
    end
  end
end
