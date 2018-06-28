require 'spec_helper'

describe 'User' do
  describe 'visits /merchants' do
    describe 'click on merchants delete' do
      it 'should delete specific merchant' do
        merchant1 = Merchant.create(name: 'one')
        merchant2 = Merchant.create(name: 'two')
        merchant3 = Merchant.create(name: 'three')

        visit '/merchants'

        expect(Merchant.count).to eq(3)

        within "delete-#{merchant2.id}" do
          click_on 'Delete'
        end

        expect(Merchant.count).to eq(2)

        expect(current_path).to eq("/merchants")

        expect(page).to have_content('one')
        expect(page).to have_content('three')
        expect(page).to_not have_content('two')
      end
    end
  end
end
