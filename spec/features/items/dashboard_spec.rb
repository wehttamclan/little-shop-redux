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
                          price: 600,
                          image: 'www.example.com')
      item2 = Item.create(title: 'some other item',
                          description: 'something else',
                          price: 400,
                          image: 'www.realimage.com')
      price = 5.00

      visit '/items-dashboard'

      within('.avg_price') do
        expect(page).to have_content('Avg Price Per Item')
        expect(page).to have_content("$#{price}")
      end
    end
    it 'will show newest item' do
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
      expected = item2.title

      visit '/items-dashboard'

      within('.created') do
        expect(page).to have_content('Item by Age')
        within('.newest') do
          expect(page).to have_content('Newest')
          expect(page).to have_content(expected)
        end
      end
    end
    it 'will show oldest item' do
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
      expected = item1.title

      visit '/items-dashboard'

      within('.created') do
        expect(page).to have_content('Item by Age')
        within('.oldest') do
          expect(page).to have_content('Oldest')
          expect(page).to have_content(expected)
        end
      end
    end
  end
end
