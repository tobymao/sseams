require 'rails_helper'

describe User do
  it 'should save' do
    expect(subject.save).to be_truthy
  end

  context 'normal user' do
    it 'should validate email' do
      user = User.new(password: 'password')
      expect(user.save).to be_falsey
    end

    it 'should validate password' do
      user = User.new(email: 'user@example.com')
      expect(user.save).to be_falsey
    end
  end

  context 'guest' do
    it 'should not validate' do
      guest = User.new_guest_user
      expect(guest.save).to be_truthy
    end
  end

  describe '.password' do
    let(:user) { create(:user) }
    it {expect(user.password).to eq('password')}
  end
end
