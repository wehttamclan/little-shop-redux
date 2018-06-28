require 'spec_helper'

describe 'User' do
  describe 'visits items/show page' do
    it 'should see a single items' do
      item1 = Item.create(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')
      item2 = Item.create(title: 'some other item',
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
      expect(page).to have_content(image)
    end
  end
end
