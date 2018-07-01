RSpec.describe Item do
  describe 'Validations' do
    it 'is invalid without a title' do
      item = Item.create(title: nil,
                         description: 'something',
                         price: 200,
                         image: 'www.example.com')

      expect(item).to_not be_valid
    end

    it 'is valid with a title' do
      item = Item.create(title: 'some item',
                         description: 'something',
                         price: 200,
                         image: 'www.example.com')

      expect(item).to be_valid
    end

    it 'is invalid without a description' do
      item = Item.create(title: 'some item',
                         description: nil,
                         price: 200,
                         image: 'www.example.com')

      expect(item).to_not be_valid
    end

    it 'is valid with a description' do
      item = Item.create(title: 'some item',
                         description: 'something',
                         price: 200,
                         image: 'www.example.com')

      expect(item).to be_valid
    end

    it 'is invalid without a price' do
      item = Item.create(title: 'some item',
                         description: 'something',
                         price: nil,
                         image: 'www.example.com')

      expect(item).to_not be_valid
    end

    it 'is valid with a price' do
      item = Item.create(title: 'some item',
                         description: 'something',
                         price: 200,
                         image: 'www.example.com')

      expect(item).to be_valid
    end

    it 'is invalid without a image' do
      item = Item.create(title: 'some item',
                         description: 'something',
                         price: 200,
                         image: nil)

      expect(item).to_not be_valid
    end

    it 'is valid with a image' do
      item = Item.create(title: 'some item',
                         description: 'something',
                         price: 200,
                         image: 'www.example.com')

      expect(item).to be_valid
    end
  end
  describe 'Class Methods' do
    it 'will count all items' do
      item1 = Item.create(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com',
                          created_at: '2018-07-01 17:18:48 UTC')
      item2 = Item.create(title: 'some other item',
                          description: 'something else',
                          price: 333,
                          image: 'www.realimage.com',
                          created_at: '2018-07-01 17:18:50 UTC')

      expect(Item.count).to eq(2)
    end
    it 'will show average price of all items' do
      item1 = Item.create(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com',
                          created_at: '2018-07-01 17:18:48 UTC')
      item2 = Item.create(title: 'some other item',
                          description: 'something else',
                          price: 400,
                          image: 'www.realimage.com',
                          created_at: '2018-07-01 17:18:50 UTC')
      expected = 3.00

      expect(Item.avg_price).to eq(expected)
    end
    it 'will show newest or oldest item' do
      item1 = Item.create(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com',
                          created_at: '2018-07-01 17:18:48 UTC')
      item2 = Item.create(title: 'some other item',
                          description: 'something else',
                          price: 333,
                          image: 'www.realimage.com',
                          created_at: '2018-07-01 17:18:50 UTC')

      expect(Item.newest).to eq(item2)
      expect(Item.oldest).to eq(item1)
    end
  end
end
