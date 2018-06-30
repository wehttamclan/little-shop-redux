RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without a merchant_id' do
      invoice = Invoice.create(merchant_id: nil,
                               status: 'something')

      expect(invoice).to_not be_valid
    end

    it 'is valid with a merchant_id' do
      invoice = Invoice.create(merchant_id: 'some invoice',
                               status: 'something')

      expect(invoice).to be_valid
    end

    it 'is invalid without a status' do
      invoice = Invoice.create(merchant_id: 'some invoice',
                               status: nil)

      expect(invoice).to_not be_valid
    end

    it 'is valid with a status' do
      invoice = Invoice.create(merchant_id: 'some invoice',
                               status: 'something')

      expect(invoice).to be_valid
    end
  end
end
