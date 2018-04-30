require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new({
    first_name: 'Testfirst',
    last_name: 'Testlast',
    email: 'test@test.test',
    password: 'test',
    password_confirmation: 'test'
    })
  }

  it 'should create a new user when first_name, last_name, email are include and password and password_confirmation match' do
    expect(user).to be_valid
  end

  it 'should not be valid when first_name is nil' do
    user.first_name = nil
    expect(user).not_to be_valid
    expect(user.errors.full_messages).to include "First name can't be blank"
  end

  it 'should not be valid when last_name is nil' do
    user.last_name = nil
    expect(user).not_to be_valid
    expect(user.errors.full_messages).to include "Last name can't be blank"
  end

  it 'should not be valid when email is nil' do
    user.email = nil
    expect(user).not_to be_valid
    expect(user.errors.full_messages).to include "Email can't be blank"
  end

  it 'should not be valid if email is already registered' do
    user.save
    @user2 = User.new({
      first_name: 'Fname',
      last_name: 'Lname',
      email: 'test@test.test',
      password: 'test',
      password_confirmation: 'test'
      })
      expect(@user2).not_to be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
  end

  it 'should not be valid if password and password_confirmation do not match' do
    user.password_confirmation = 'blah'
    expect(user).not_to be_valid
  end

end
