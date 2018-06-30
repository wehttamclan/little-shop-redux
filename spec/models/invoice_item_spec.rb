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
end
