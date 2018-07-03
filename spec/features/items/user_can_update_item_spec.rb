require 'spec_helper'

describe 'User' do
  describe 'visits /items/:id/edit' do
    it 'should see a form, update a item and land on item show' do
      test_item = Item.create(title: 'dongle',
                              description: 'something',
                              price: 200,
                              image: 'tulip.jpg')

      visit('/items')

      within('.item-buttons') do
        click_on 'Edit'
      end

      expect(current_path).to eq("/items/#{test_item.id}/edit")

      fill_in 'item[title]', with: 'some other dongle'
      fill_in 'item[description]', with: 'something else'
      fill_in 'item[price]', with: 222
      fill_in 'item[image]', with: 'www.otherexample.com'

      click_button 'Update Item'

      expect(current_path).to eq("/items/#{test_item.id}")
      expect(page).to have_content('some other dongle')
      expect(page).to have_content('something else')
      expect(page).to have_content(222)
    end
  end
end
