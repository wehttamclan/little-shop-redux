require 'spec_helper'

describe 'User' do
  describe 'visits merchants dashboard' do
    it 'should see merchant name' do
      merchant = Merchant.create(name: 'one')

      visit "/merchants-dashboard"

      within("##{merchant.name}") do
        expect(page).to have_content(merchant.name)
      end
    end

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

      visit "/merchants-dashboard"

      within("#item-count-#{merchant.id}") do
        expect(page).to have_content(expected)
      end
    end

    it 'should see the average item price for each merchant' do
      merchant = Merchant.create(name: 'one')
      item1 = merchant.items.create!(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')
      item2 = merchant.items.create!(title: 'some other item',
                          description: 'something else',
                          price: 300,
                          image: 'www.realimage.com')

      expected = merchant.avg_item_price

      visit "/merchants-dashboard"

      within("#average-price-#{merchant.id}") do
        expect(page).to have_content(expected)
      end
    end

    it 'should see the total cost of each merchants items' do
      merchant = Merchant.create(name: 'one')
      item1 = merchant.items.create!(title: 'some item',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')
      item2 = merchant.items.create!(title: 'some other item',
                          description: 'something else',
                          price: 300,
                          image: 'www.realimage.com')

      expected = merchant.total_cost_of_items

      visit "/merchants-dashboard"

      within("#total-cost-#{merchant.id}") do
        expect(page).to have_content(expected)
      end
    end

    it 'should see the name of the merchant with the most items' do
      merchant1 = Merchant.create(name: 'Peters')
      merchant2 = Merchant.create(name: 'Bricker')
      merchant1.items.create(title: 'item1',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')
      merchant1.items.create(title: 'item2',
                          description: 'something else',
                          price: 333,
                          image: 'www.realimage.com')
      merchant2.items.create(title: '3',
                          description: 'something',
                          price: 200,
                          image: 'www.example.com')

      expected = merchant1.name

      visit "/merchants-dashboard"

      within('#merchant-with-most-items') do
        expect(page).to have_content(expected)
      end
    end
  end
end
# Average price of item for this merchant
# Total price for all items for this merchant
# Merchant with the most items and that merchant's information
# Merchant with the highest priced item and that merchant's information
