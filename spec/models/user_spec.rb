require 'rails_helper'

RSpec.describe User, type: :model do
   describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :phone_number}
    it {should validate_presence_of :password_digest}
   end
end
