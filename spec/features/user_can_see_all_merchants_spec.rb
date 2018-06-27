require 'spec_helper'

describe 'User' do
  describe 'visits merchants/index page' do
    it 'should see all merchants' do
      merchant1 = Merchant.create(name: 'Peters')
      merchant2 = Merchant.create(name: 'Bricker')
      peters = merchant1.name
      bricker = merchant2.name

      visit('merchants/index')

      expect(page).to have_content(peters)
      expect(page).to have_content(bricker)
    end
  end
end
