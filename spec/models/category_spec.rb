require 'rails_helper'


RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.new(first_name: 'Peter', last_name: 'Parker', email: 'Spidey@gmail.com', password: 'watson')
    @category = Category.create(name: 'Web Shooters', icon: 'web-shooter.png', user_id: @user.id)
  end
  describe 'Testing model category' do
    it 'should be valid' do
      expect(@category.name).to eq 'Web Shooters'
    end
    it 'should be valid' do
      expect(@category.icon).to eq 'web-shooter.png'
    end
  end
end