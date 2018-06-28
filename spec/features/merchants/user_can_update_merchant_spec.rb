require 'spec_helper'

describe 'User' do
  describe 'visits /merchants/:id/edit' do
    it 'should see a form, update a merchant and land on merchant show' do
      test_merchant = Merchant.create(name: 'dingle')

      visit('/merchants')

      click_link 'Edit'

      expect(current_path).to eq("/merchants/#{test_merchant.id}/edit")

      fill_in 'merchant[name]', with: 'Pete'

      click_button 'Update Merchant'

      expect(current_path).to eq("/merchants/#{test_merchant.id}")
      expect(page).to have_content('Pete')
    end
  end
end
