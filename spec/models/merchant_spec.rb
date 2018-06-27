RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.create(name: nil)

      expect(merchant).to_not be_valid
    end
    it 'is valid with a name' do
      merchant = Merchant.create(name: 'Test')

      expect(merchant).to be_valid
    end
  end
end
