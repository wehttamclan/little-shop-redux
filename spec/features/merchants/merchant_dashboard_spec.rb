require 'spec_helper'

describe 'User' do
  describe 'visits merchants dashboard' do
    it 'should see item count for the merchant' do
      merchant = Merchant.create(name: 'one')
      item1 = merchant.items.create!(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')
      item2 = merchant.items.create!(title: 'some other item',
                          description: 'something else',
                          price: 333,
                          image: 'www.realimage.com')

      expected = merchant.items.length

      visit "/merchants/merchants-dashboard"

      within("#item-count-#{merchant.id}") do
        expect(page).to have_content(expected)
      end
    end
  end
end
