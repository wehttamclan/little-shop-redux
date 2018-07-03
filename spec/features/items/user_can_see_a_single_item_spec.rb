require 'spec_helper'

describe 'User' do
  describe 'visits items/show page' do
    it 'should see a single items' do
      merchant = Merchant.create(name: 'ian')
      item1 = merchant.items.create(title: 'some item',
                                    description: 'something',
                                    price: 200,
                                    image: 'www.example.com')
      item2 = merchant.items.create(title: 'some other item',
                                    description: 'something else',
                                    price: 333,
                                    image: 'www.realimage.com')

      title = item1.title
      desc = item1.description
      price = item2.price
      image = item2.image

      visit("/items/#{item1.id}")

      expect(page).to have_content(title)
      expect(page).to have_content(desc)

      visit("/items/#{item2.id}")

      expect(page).to have_content(price)
    end
  end
end
