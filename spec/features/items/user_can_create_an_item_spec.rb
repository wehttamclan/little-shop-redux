require 'spec_helper'

describe 'User' do
  describe 'visits /items/new' do
    it 'should see a form and create a item' do
      visit('/items/new')

      fill_in 'item[title]', with: 'dongle'
      fill_in 'item[description]', with: 'something'
      fill_in 'item[price]', with: 201
      fill_in 'item[image]', with: 'www.example.com'

      expect(Item.count).to eq(0)
      click_on 'Submit'

      expect(current_path).to eq('/items')
      expect(Item.count).to eq(1)

      expect(page).to have_content('dongle')
      expect(page).to have_content(201)
    end
  end
end
