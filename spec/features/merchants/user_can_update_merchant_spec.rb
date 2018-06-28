require 'spec_helper'

describe 'User' do
  describe 'visits /merchants/edit' do
    it 'should see a form and update a merchant' do
      merchant = Merchant.create(name: 'dingle')

      visit('/merchants')

      click_on 'Edit'

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")

      fill_in 'merchant[name]', with: 'Pete'

      click_on 'Submit'

      expect(current_path).to eq("/merchants/#{merchant.id}")
      expect(page).to have_content('Pete')
    end
  end
end
