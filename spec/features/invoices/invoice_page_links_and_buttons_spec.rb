RSpec.describe do
  before(:each) do
    @merchant = Merchant.create(name: 'Whatever')
    @item1 = Item.create(id: 10,
                         title: 'Item One',
                         description: 'description',
                         price: 100,
                         image: 'not found')
    @item2 = Item.create(id: 20,
                         title: 'Item Two',
                         description: 'description',
                         price: 10,
                         image: 'not found')
    @item3 = Item.create(id: 30,
                         title: 'Item Three',
                         description: 'description',
                         price: 44,
                         image: 'not found')
    @item4 = Item.create(id: 40,
                         title: 'Item Four',
                         description: 'description',
                         price: 44,
                         image: 'not found')
    @invoice1 = Invoice.create(merchant_id: 1,
                               status: 'pending')
    @invoice2 = Invoice.create(merchant_id: 1,
                               status: 'pending')
    @invoice3 = Invoice.create(merchant_id: 1,
                               status: 'pending')
    @invoice4 = Invoice.create(merchant_id: 1,
                               status: 'pending')
    @invoice_item1 = @invoice1.invoice_items.create(item_id: 10,
                                                    quantity: 3,
                                                    unit_price: 100)
    @invoice_item2 = @invoice2.invoice_items.create(item_id: 20,
                                                    quantity: 3,
                                                    unit_price: 10)
    @invoice_item3 = @invoice3.invoice_items.create(item_id: 30,
                                                    quantity: 10,
                                                    unit_price: 44)
    @invoice_item4 = @invoice4.invoice_items.create(item_id: 40,
                                                    quantity: 1,
                                                    unit_price: 44)
    @invoice_items = InvoiceItem.all
  end
  context 'dashboard page' do
    it 'can link to invoice with highest unit price' do
      visit '/invoices-dashboard'

      click_link('1')
      expect(current_path).to eq("/invoices/#{@invoice_items.highest_price}")
    end
    it 'can link to invoice with lowest unit price' do
      visit '/invoices-dashboard'

      click_link('2')
      expect(current_path).to eq("/invoices/#{@invoice_items.lowest_price}")
    end
    it 'can link to invoice with highest quantity' do
      visit '/invoices-dashboard'

      click_link('3')
      expect(current_path).to eq("/invoices/#{@invoice_items.highest_quantity}")
    end
    it 'can link to invoice with lowest quantity' do
      visit '/invoices-dashboard'

      click_link('4')
      expect(current_path).to eq("/invoices/#{@invoice_items.lowest_quantity}")
    end
  end
  context 'edit page' do
    it 'can cancel the update' do
      visit "/invoices/#{@invoice1.id}/edit"
      click_link('Cancel')

      expect(current_path).to eq('/invoices/1')
    end
  end
end
