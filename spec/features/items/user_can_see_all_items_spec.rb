require 'spec_helper'

describe 'User' do
  describe 'visits items index page' do
    it 'should see all items' do
      item1 = Item.create(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')
      item2 = Item.create(title: 'some other item',
                          description: 'something else',
                          price: 333,
                          image: 'tulip.jpg')
      title = item1.title
      price = (item2.price) / 100.0
      image = item2.image

      visit('/items')

      expect(page).to have_content(title)
      expect(page).to have_content(price)
    end
  end
end
