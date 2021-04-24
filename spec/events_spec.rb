require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /show' do
    it 'Redirects to login if not signed' do
      get '/events/1'
      expect(response).to redirect_to(login_path)
    end
  end

  describe 'GET /new' do
    it 'Redirects to login if not signed' do
      get '/events/new'
      expect(response).to redirect_to(login_path)
    end
  end
  describe 'Name presence' do
    describe 'All presence' do
      it 'If creator_id not present' do
        expect do
          Event.create!(name: 'event', description: 'description',
                        date: '2021-4-27 00:00:00')
        end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Creator must exist')
      end
    end
  end

  describe 'Events attendees' do
    it ': An Event can have many attendees' do
      creator = User.create(name: 'creator')
      attendee1 = User.create(name: 'attendee1')
      attendee2 = User.create(name: 'attendee2')

      event = Event.create(user_id: creator.id, name: 'event name', date: Date.today, description: 'description')
      event.attendees = [attendee1, attendee2]
      event.save

      saved_event = Event.find(event.id)
      expect(saved_event.attendees.size).to eq(2)
    end
  end
end
