require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(first_name: 'Peter', last_name: 'Parker', email: 'Spidey@gmail.com', password: 'watson')
    # @user.confirm
  end
  describe 'Testing user model' do
    # it 'should be valid' do
    #   expect(@user).to be_valid
    # end

    it 'Should equal first_name' do
      expect(@user.first_name).to eq 'Peter'
    end
    it 'Should equal last_name' do
      expect(@user.last_name).to eq 'Parker'
    end

    it 'should eqaul email' do
      expect(@user.email).to eq 'Spidey@gmail.com'
    end
    it 'should eqaul password' do
      expect(@user.password).to eq 'watson'
    end
  end
end
