require 'rails_helper'

RSpec.describe Registration, type: :model do

  describe 'Associations' do
    it 'Belongs to creator' do
      event = Registration.reflect_on_association(:user)
      expect(event.macro).to eq(:belongs_to)
    end

    it 'Has many registrations' do
      event = Registration.reflect_on_association(:event)
      expect(event.macro).to eq(:belongs_to)
    end
  end
    it 'Belongs to user' do
    should respond_to :user_id
  end
    it 'Belongs to event' do
     should respond_to :event_id 
  end
end
