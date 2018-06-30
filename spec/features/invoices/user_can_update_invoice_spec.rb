require 'spec_helper'

describe 'User' do
  describe 'visits /invoices/:id/edit' do
    it 'should see a form, update a invoice and land on invoice show' do
      test_invoice = Invoice.create(merchant_id: 1,
                               status: 'something')

      visit('/invoices')

      click_link 'Edit'

      expect(current_path).to eq("/invoices/#{test_invoice.id}/edit")

      # fill_in 'invoice[merchant_id]', with: 2
      fill_in 'invoice[status]', with: 'something else'

      click_button 'Update Item'

      expect(current_path).to eq("/invoices/#{test_invoice.id}")
      expect(page).to have_content(1)
      expect(page).to have_content('something else')
    end
  end
end
