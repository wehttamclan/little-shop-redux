require 'spec_helper'
require 'pry'
describe 'User' do
  describe 'visits /merchants/edit' do
    it 'should see a form and update a merchant and land on merchant show' do
      merchant = Merchant.create(name: 'dingle')

      visit('/merchants')

      click_link 'Edit'

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")

      fill_in 'merchant[name]', with: 'Pete'

      click_button 'Update Merchant'

      expect(current_path).to eq("/merchants/#{merchant.id}")
      expect(page).to have_content('Pete')
    end
  end
end
