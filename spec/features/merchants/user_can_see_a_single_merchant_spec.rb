require 'spec_helper'

describe 'User' do
  describe 'visits merchants/show page' do
    it 'should see a single merchants' do
      merchant1 = Merchant.create(name: 'Pete')
      merchant2 = Merchant.create(name: 'Brick')
      merchant3 = Merchant.create(name: 'Rob')

      peters = merchant1.name
      brick = merchant2.name
      rob = merchant3.name

      visit("/merchants/#{merchant1.id}")

      expect(page).to have_content(peters)

      visit("/merchants/#{merchant2.id}")

      expect(page).to have_content(brick)

      visit("/merchants/#{merchant3.id}")

      expect(page).to have_content(rob)
    end
  end
end
