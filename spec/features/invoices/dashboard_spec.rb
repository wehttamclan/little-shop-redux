require 'spec_helper'

describe 'User' do
  context 'visits invoices dashboard' do
    it 'will show percentage of statuses' do
      invoice1 = Invoice.create(merchant_id: 1,
                          status: 'pending')
      invoice2 = Invoice.create(merchant_id: 1,
                          status: 'shipped')
      invoice3 = Invoice.create(merchant_id: 1,
                          status: 'returned')
      invoice4 = Invoice.create(merchant_id: 1,
                          status: 'returned')
      invoice1.invoice_items.create(item_id: 123,
                                    quantity: 3,
                                    unit_price: 44)
      invoice2.invoice_items.create(item_id: 124,
                                    quantity: 6,
                                    unit_price: 74)
      invoice3.invoice_items.create(item_id: 125,
                                    quantity: 9,
                                    unit_price: 94)

      pending  = 25
      shipped  = 25
      returned = 50

      visit '/invoices-dashboard'

      within('.status') do
        expect(page).to have_content('Status Percentage')
        expect(page).to have_content('Pending')
        expect(page).to have_content('Shipped')
        expect(page).to have_content('Returned')
        within('.pending') do
          expect(page).to have_content("#{pending}%")
        end
        within('.shipped') do
          expect(page).to have_content("#{shipped}%")
        end
        within('.returned') do
          expect(page).to have_content("#{returned}%")
        end
      end
    end
    it 'gives invoices with highest and lowest total price' do
      invoice1 = Invoice.create(merchant_id: 1,
                                status: 'shipped')
      invoice2 = Invoice.create(merchant_id: 1,
                                status: 'shipped')
      invoice3 = Invoice.create(merchant_id: 1,
                                status: 'returned')
      invoice1.invoice_items.create(item_id: 123,
                                    quantity: 3,
                                    unit_price: 44)
      invoice2.invoice_items.create(item_id: 124,
                                    quantity: 6,
                                    unit_price: 74)
      invoice3.invoice_items.create(item_id: 125,
                                    quantity: 9,
                                    unit_price: 94)
      highest = 3
      lowest  = 1

      visit '/invoices-dashboard'

      within('.prices') do
        expect(page).to have_content('Unit Prices')
        expect(page).to have_content('Highest')
        within('.highest_price') do
          expect(page).to have_content(highest)
        end
        expect(page).to have_content('Lowest')
        within('.lowest_price') do
          expect(page).to have_content(lowest)
        end
      end
    end
    it 'gives invoices with highest and lowest total quantity' do
      invoice1 = Invoice.create(merchant_id: 1,
                                status: 'shipped')
      invoice2 = Invoice.create(merchant_id: 1,
                                status: 'shipped')
      invoice3 = Invoice.create(merchant_id: 1,
                                status: 'returned')
      invoice1.invoice_items.create(item_id: 123,
                                    quantity: 3,
                                    unit_price: 44)
      invoice2.invoice_items.create(item_id: 124,
                                    quantity: 6,
                                    unit_price: 74)
      invoice3.invoice_items.create(item_id: 125,
                                    quantity: 9,
                                    unit_price: 94)
      highest = 3
      lowest  = 1

      visit '/invoices-dashboard'

      within('.quantity') do
        expect(page).to have_content('Quantity')
        expect(page).to have_content('Highest')
        within('.highest_quantity') do
          expect(page).to have_content(highest)
        end
        expect(page).to have_content('Lowest')
        within('.lowest_quantity') do
          expect(page).to have_content(lowest)
        end
      end
    end
  end
end
