RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without a merchant_id' do
      invoice = Invoice.create(merchant_id: nil,
                               status: 'something')

      expect(invoice).to_not be_valid
    end

    it 'is invalid without a status' do
      invoice = Invoice.create(merchant_id: 123,
                               status: nil)

      expect(invoice).to_not be_valid
    end

    it 'is valid with all attributes' do
      invoice = Invoice.create(merchant_id: 234,
                               status: 'something')

      expect(invoice).to be_valid
    end

    it 'can calculate total price for each invoice' do
      test_invoice = Invoice.create(merchant_id: 234,
                                    status: 'pending')

      invoice_item_1 = InvoiceItem.create(item_id: 123,
                                          invoice_id: 1,
                                          quantity: 2,
                                          unit_price: 100)

      invoice_item_2 = InvoiceItem.create(item_id: 234,
                                          invoice_id: 1,
                                          quantity: 3,
                                          unit_price: 200)

      expect(test_invoice.total_price).to eq(800)
    end
  end
end
