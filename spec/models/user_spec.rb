require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    describe 'test first_name validation' do
      it 'expect error if first_name is nil' do
        @user = User.create(first_name: nil, last_name: "Smith", email: "amysmith@email.com", password: "111", password_confirmation: "111")
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end

    describe 'test last_name validation' do
      it 'expect error if last_name is nil' do
        @user = User.create(first_name: "Amy", last_name: nil, email: "amysmith@email.com", password: "111", password_confirmation: "111")
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    describe 'test email validation' do
      it 'expect error if email is nil' do
        @user = User.create(first_name: "Amy", last_name: "Smith", email: nil, password: "111", password_confirmation: "111")
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end

    describe 'test password validation' do
      it 'expect error if password is nil' do
        @user = User.create(first_name: "Amy", last_name: "Smith", email: "amysmith@email.com", password: nil, password_confirmation: "111")
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    end

    describe 'test password_confirmation validation' do
      it 'expect error if password_confirmation is nil' do
        @user = User.create(first_name: "Amy", last_name: "Smith", email: "amysmith@email.com", password: "111", password_confirmation: nil)
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end

    describe 'test if passwrod matches with password_confirmation' do
      it 'expect error if password does not match password_confirmation' do
        @user = User.create(first_name: "Amy", last_name: "Smith", email: "amysmith@email.com", password: "111", password_confirmation: "222")
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    describe 'test if email is unique' do
      it 'expect error if email has been used before' do
        @user = User.create(first_name: "Amy", last_name: "Smith", email: "amysmith@email.com", password: "111", password_confirmation: "111")
        @user2 = User.create(first_name: "Clare", last_name: "Smith", email: "amysMith@email.com", password: "111", password_confirmation: "111")
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end
