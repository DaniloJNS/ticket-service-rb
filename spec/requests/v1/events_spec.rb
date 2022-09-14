require 'rails_helper'

RSpec.describe 'V1::Events', type: :request do
  describe 'GET /v1/events' do
    context 'without events' do
      it 'return empty' do
        get '/v1/events'

        expect(response).to have_http_status(:no_content)
        expect(response.body).to be_empty
      end
    end

    context 'with many events' do
      let!(:events) { create_list(:event_with_tickets, 3) }
      let(:response_body) do
        events.map do |event|
          load_dynamic_json_symbolized(
            'requests/events.json.erb',
            event: event,
            ticket: event.tickets.first
          )
        end
      end

      it 'return all events' do
        get '/v1/events'

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include 'application/json'
        expect(parsed_body).to eq(response_body)
      end
    end
  end

  describe 'GET /v1/events' do
    context 'when event not exists' do
      it 'return empty body' do
        get '/v1/events/123'

        expect(response).to have_http_status(:not_found)
        expect(response.body).to be_empty
      end
    end

    context 'when events exists' do
      let!(:event) { create(:event_with_tickets) }
      let(:response_body) do
        load_dynamic_json_symbolized(
          'requests/events.json.erb',
          event: event,
          ticket: event.tickets.first
        )
      end

      it 'return data' do
        get '/v1/events', params: { id: event.id }

        expect(response).to have_http_status(:ok)
        expect(parsed_body).to include(response_body)
      end
    end
  end
end
