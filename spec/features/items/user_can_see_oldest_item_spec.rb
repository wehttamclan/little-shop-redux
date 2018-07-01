require 'spec_helper'

describe 'Class Methods' do
  context 'visits items dashboard' do
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

      visit '/items-dashboard'

      within('.created') do
        expect(page).to have_content('Item by Age')
        within('.oldest') do
          expect(page).to have_content('Oldest')
        end
      end
    end
  end
end
