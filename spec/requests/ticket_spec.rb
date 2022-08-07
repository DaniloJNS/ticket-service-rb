require 'rails_helper'

describe '/v1/tickect' do
  it 'return all ticket' do
    get '/v1/tickets'

    expect(response).to have_http_status(:ok)
  end
end
