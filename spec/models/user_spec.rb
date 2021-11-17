require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    describe 'test first_name validation' do
      it 'expect error if first_name is nil' do
        @user = User.create(first_name: nil, last_name: "Smith", email: "amysmith@email.com", password: "111", password_confirmation: "111")
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end


  end
end
