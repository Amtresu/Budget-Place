require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before(:each) do
    @user = User.new(first_name: 'Peter', last_name: 'Parker', email: 'Spidey@gmail.com', password: 'watson')
    @category = Category.create(name: 'Web Shooters', icon: 'web-shooter.png', user_id: @user.id)
    @purchase = Purchase.create(name: 'Web Fluid', amount: 200, created_at: Time.now,
                                updated_at: Time.now, category_id: @category.id, user_id: @user.id)
  end
  describe 'Testing Purchase model' do
    it 'should give Purchase name' do
      expect(@purchase.name).to eq 'Web Fluid'
    end
    it 'should give Purchase amount' do
      expect(@purchase.amount).to eq 200
    end
  end
end
