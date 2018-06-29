require 'spec_helper'

describe 'User' do
  describe 'visits /invoices' do
    describe 'clicks on delete' do
      it 'should delete specific invoice' do
        invoice1 = Invoice.create(merchant_id: 1,
                                  status: 'something')
        invoice2 = Invoice.create(merchant_id: 2,
                                  status: 'something else')
        invoice3 = Invoice.create(merchant_id: 3,
                                  status: 'returned')

        visit '/invoices'

        expect(Invoice.count).to eq(3)

        within "#delete-#{invoice2.id}" do
          click_button('Delete')
        end

        expect(Invoice.count).to eq(2)

        expect(current_path).to eq('/invoices')

        expect(page).to have_content(1)
        expect(page).to have_content(3)
        expect(page).to_not have_content(2)
      end
    end
  end
end
