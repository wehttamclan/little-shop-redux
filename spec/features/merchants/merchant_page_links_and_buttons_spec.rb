RSpec.describe do
  before(:each) do
    @merchant1 = Merchant.create(name: 'Merchant One')
    @merchant2 = Merchant.create(name: 'Merchant Two')
    @item1 = @merchant1.items.create(id: 10,
                         title: 'Item One',
                         description: 'description',
                         price: 100,
                         image: 'not found')
    @item2 = @merchant2.items.create(id: 20,
                         title: 'Item Two',
                         description: 'description',
                         price: 10,
                         image: 'not found')
    @invoice1 = Invoice.create(merchant_id: 1,
                                status: 'pending')
    @invoice2 = Invoice.create(merchant_id: 2,
                                status: 'pending')
    @invoice_item1 = @invoice1.invoice_items.create(item_id: 10,
                                                    quantity: 3,
                                                    unit_price: 100)
    @invoice_item2 = @invoice2.invoice_items.create(item_id: 20,
                                                    quantity: 50,
                                                    unit_price: 10)
  end

  context 'Merchant dashboard page' do
    it 'shows the link to merchant with most items' do

      visit '/merchants-dashboard'

      within('.most-items') do
        click_link 'Merchant Two'
      end

      expect(current_path).to eq('/merchants/2')
    end

    it 'shows the link to merchant with highest priced items' do

      visit '/merchants-dashboard'

      within('.highest-item') do
        click_link 'Merchant One'
      end

      expect(current_path).to eq('/merchants/1')
    end
  end

  context 'edit page' do
    it 'can cancel the update' do

      visit "/merchants/#{@merchant1.id}/edit"

      within('#merchant-edit-buttons') do
        click_on('Cancel')
      end

      expect(current_path).to eq("/merchants/#{@merchant1.id}")
    end
  end

  context 'new page' do
    it 'can cancel the create' do

      visit '/merchants/new'

      within('#merchant-edit-buttons') do
        click_on('Cancel')
      end

      expect(current_path).to eq('/merchants')
    end
  end
end
