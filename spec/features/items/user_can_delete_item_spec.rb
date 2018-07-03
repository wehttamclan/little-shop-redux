require 'spec_helper'

describe 'User' do
  describe 'visits /items' do
    describe 'clicks on delete' do
      it 'should delete specific item' do
        merchant = Merchant.create(name: 'ian')
        item1 = merchant.items.create(title: 'some item',
                            description: 'something',
                            price: 200,
                            image: 'www.example.com')
        item2 = merchant.items.create(title: 'some other item',
                            description: 'something else',
                            price: 333,
                            image: 'www.realimage.com')
        item3 = merchant.items.create(title: 'brush',
                            description: 'bristles',
                            price: 4,
                            image: 'www.brushpic.com')

        visit '/items'

        expect(Item.count).to eq(3)

        within "#delete-#{item2.id}" do
          click_button("Delete")
        end

        expect(Item.count).to eq(2)

        expect(current_path).to eq("/items")

        expect(page).to have_content('some item')
        expect(page).to have_content('brush')
        expect(page).to_not have_content('some other item')
      end
    end
  end

  describe 'visits /items/show' do
    describe 'clicks on delete' do
      it 'should delete specific item' do
        merchant = Merchant.create(name: 'ian')
        item1 = merchant.items.create(title: 'some item',
                                      description: 'something',
                                      price: 200,
                                      image: 'www.example.com')
        item2 = merchant.items.create(title: 'some other item',
                                      description: 'something else',
                                      price: 333,
                                      image: 'www.realimage.com')
        item3 = merchant.items.create(title: 'brush',
                                      description: 'bristles',
                                      price: 4,
                                      image: 'www.brushpic.com')

        visit '/items'

        expect(Item.count).to eq(3)
        expect(page).to have_content('brush')

        visit "items/#{item2.id}"

        click_button 'Delete'

        expect(current_path).to eq('/items')

        expect(Item.count).to eq(2)

        expect(page).to have_content('some item')
        expect(page).to have_content('brush')
        expect(page).to_not have_content('some other item')
      end
    end
  end
end
