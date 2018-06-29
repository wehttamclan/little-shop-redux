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
end
