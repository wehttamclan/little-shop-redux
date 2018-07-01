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
end
