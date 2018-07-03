RSpec.describe do
  before(:each) do
    @item1 = Item.create(title: 'Item One',
                         description: 'description',
                         price: 100,
                         image: 'not found',
                         created_at: '2018-07-01 17:18:48 UTC')
    @item2 = Item.create(title: 'Item Two',
                         description: 'description',
                         price: 300,
                         image: 'not found',
                         created_at: '2018-07-01 17:18:50 UTC')
  end
  context 'Item dashboard page' do
    it 'shows the link to newest item' do
      visit '/items-dashboard'
      click_link 'Item Two'

      expect(current_path).to eq('/items/2')
    end
    it 'shows the link to oldest item' do
      visit '/items-dashboard'
      click_link 'Item One'

      expect(current_path).to eq('/items/1')
    end
  end
  context 'edit page' do
    it 'can cancel the update' do
      visit "/items/#{@item1.id}/edit"
      click_link('Cancel')

      expect(current_path).to eq('/items/1')
    end
  end
  context 'new page' do
    it 'can cancel the create' do
      visit '/items/new'
      click_link('Cancel')

      expect(current_path).to eq('/items')
    end
  end
end
