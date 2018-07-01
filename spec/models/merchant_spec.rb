RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.create(name: nil)

      expect(merchant).to_not be_valid
    end
    it 'is valid with a name' do
      merchant = Merchant.create(name: 'Test')

      expect(merchant).to be_valid
    end
  end
  describe 'instance methods' do
    describe '.average_price' do
      it 'should return the average price of all items' do
        test_merchant = Merchant.create(name: 'Test Merchant')
        item1 = test_merchant.items.create(title: 'some item',
                            description: 'something',
                            price: 200,
                            image: 'www.example.com',
                            created_at: '2018-07-01 17:18:48 UTC')
        item2 = test_merchant.items.create(title: 'some other item',
                            description: 'something else',
                            price: 400,
                            image: 'www.realimage.com',
                            created_at: '2018-07-01 17:18:50 UTC')
        expected = 300

        expect(test_merchant.average_price).to eq(expected)
      end
    end
  end
end
