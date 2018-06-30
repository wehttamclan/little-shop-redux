require 'spec_helper'

describe 'total item count' do
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
  end
end
