RSpec.describe User, type: :model do
  describe 'A user can be created' do
    let(:name) { 'simple name' }

    it 'user is valid' do
      user = User.create(name: 'username')
      expect(user).to be_valid
    end

    it 'Name is not present' do
      user = User.create
      expect(user).to_not be_valid
    end

    it 'Missing name on user' do
      user = User.create(name: nil)
      user.validate
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end
