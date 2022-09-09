require 'rails_helper'

RSpec.describe 'V1::Events', type: :request do
  describe 'GET /v1/events' do
    context 'without events' do
      it 'return empty' do
        get '/v1/events'

        expect(response).to have_http_status(:no_content)
      end
    end

    xcontext 'with many events' do
      let(:response_body) do
        events.map do |event|
          event.reload
          load_dynamic_json_symbolized(
            'requests/events.json.erb',
            event: event,
            ticket: event.tickets.first
          )
        end
      end
      let!(:events) { create_list(:event_with_tickets, 3) }

      it 'return all events' do
        get '/v1/events'

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to include 'application/json'
        expect(parsed_body).to eq(response_body)
      end
    end
  end
end
