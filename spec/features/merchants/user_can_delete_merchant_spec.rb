require 'spec_helper'

describe 'User' do
  describe 'visits /merchants' do
    describe 'clicks on delete' do
      it 'should delete specific merchant' do
        merchant1 = Merchant.create(name: 'one')
        merchant2 = Merchant.create(name: 'two')
        merchant3 = Merchant.create(name: 'three')

        visit '/merchants'

        expect(Merchant.count).to eq(3)

        within "#delete-#{merchant2.id}" do
          click_button("Delete")
        end

        expect(Merchant.count).to eq(2)

        expect(current_path).to eq("/merchants")

        expect(page).to have_content('one')
        expect(page).to have_content('three')
        expect(page).to_not have_content('two')
      end
    end
  end

  describe 'visits /merchants/show' do
    describe 'clicks on delete' do
      it 'should delete specific merchant and redirect to merchant index' do
        merchant1 = Merchant.create(name: 'one')
        merchant2 = Merchant.create(name: 'two')
        merchant3 = Merchant.create(name: 'three')
        item1 = merchant2.items.create(title: 'brush',
                                       description: 'bristles',
                                       price: 4,
                                       image: 'www.brushpic.com')

        visit '/merchants'

        expect(Merchant.count).to eq(3)
        expect(page).to have_content('two')

        visit "/merchants/#{merchant2.id}"

        within(".delete-#{merchant2.id}") do
          click_button 'Delete'
        end

        expect(current_path).to eq('/merchants')

        expect(Merchant.count).to eq(2)

        expect(page).to have_content('one')
        expect(page).to have_content('three')
        expect(page).to_not have_content('two')
      end
    end
  end
end
