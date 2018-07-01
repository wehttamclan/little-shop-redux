require 'spec_helper'

describe 'Class Methods' do
  context 'visits items dashboard' do
    it 'will show total number of items' do
      item1 = Item.create(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')
      item2 = Item.create(title: 'some other item',
                          description: 'something else',
                          price: 333,
                          image: 'www.realimage.com')
      count = 2

      visit '/items-dashboard'

      within('.item_count') do
        expect(page).to have_content('Total Item Count')
        expect(page).to have_content(count)
      end
    end
    it 'will show average price of items' do
      item1 = Item.create(title: 'some item',
                          description: 'something',
                          price: 2.11,
                          image: 'www.example.com')
      item2 = Item.create(title: 'some other item',
                          description: 'something else',
                          price: 4.33,
                          image: 'www.realimage.com')
      price = 3.22

      visit '/items-dashboard'

      within('.avg_price') do
        expect(page).to have_content('Avg Price Per Item')
        expect(page).to have_content("$#{price}")
      end
    end
  end
end
