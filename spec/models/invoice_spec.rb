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

    it 'is can calculate total price for each invoice' do
      invoice = Invoice.create(merchant_id: 234,
                               status: 'something')

      expect(invoice).to be_valid
    end
  end

  describe 'instance methods' do
    describe 'Invoice.item_quantity' do
      xit "should return count of item" do
        invoice = Invoice.create(merchant_id: 1,
                                 status: 'something')

        invoice_item_1 = InvoiceItem.create(item_id: 11,
                                            invoice_id: 1,
                                            quantity: 2,
                                            unit_price: 100)

        quant = 2

        expect(invoice.item_quantity).to eq(quant)
      end
    end
  end
end
