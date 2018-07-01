RSpec.describe InvoiceItem do
  describe 'Validations' do
    it 'is invalid without a item_id' do
      invoice_item = InvoiceItem.create(item_id: nil,
                                        invoice_id: 123,
                                        quantity: 3,
                                        unit_price: 44)

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a invoice_id' do
      invoice_item = InvoiceItem.create(item_id: 123,
                                        invoice_id: nil,
                                        quantity: 3,
                                        unit_price: 44)

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a quantity' do
      invoice_item = InvoiceItem.create(item_id: 234,
                                        invoice_id: 123,
                                        quantity: nil,
                                        unit_price: 44)

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a unit_price' do
      invoice_item = InvoiceItem.create(item_id: 2435,
                                        invoice_id: 123,
                                        quantity: 3,
                                        unit_price: nil)

      expect(invoice_item).to_not be_valid
    end

    it 'is valid with all attributes' do
      invoice_item = InvoiceItem.create(item_id: 24355,
                                        invoice_id: 123,
                                        quantity: 3,
                                        unit_price: 44)

      expect(invoice_item).to be_valid
    end
  end
  describe 'Class methods' do
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

      expect(InvoiceItem.highest_price).to eq(highest)
      expect(InvoiceItem.lowest_price).to eq(lowest)
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

      expect(InvoiceItem.highest_quantity).to eq(highest)
      expect(InvoiceItem.lowest_quantity).to eq(lowest)
    end
  end
end
