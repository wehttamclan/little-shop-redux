RSpec.describe do
  context 'can visit the other pages using provided links' do
    it 'can render homepage' do
      visit '/'

      expect(current_path).to eq('/')
      expect(page).to have_content('Merchants')
      expect(page).to have_content('Items')
      expect(page).to have_content('Invoices')
    end
    it 'can visit /merchants/index' do

      visit '/'
      within('.links') do
        click_link('Merchants')

        expect(current_path).to eq('/merchants')
      end
    end
    it 'can visit /items/index' do

      visit '/'
      within('.links') do
      click_link('Items')

      expect(current_path).to eq('/items')
      end
    end
    it 'can visit /invoices/index' do

      visit '/'
      within('.links') do
        click_link('Invoices')

        expect(current_path).to eq('/invoices')
      end
    end
  end
end
