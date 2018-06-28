require 'spec_helper'

describe 'User' do
  describe 'visits /merchants/new' do
    it 'should see a form and create a merchant' do
      visit('/merchants/new')

      fill_in 'merchant[name]', with: 'Pete'

      expect(Merchant.count).to eq(0)
      click_on 'Submit'

      expect(current_path).to eq('/merchants')
      expect(Merchant.count).to eq(1)
      expect(page).to have_content('Pete')
    end
  end
end
