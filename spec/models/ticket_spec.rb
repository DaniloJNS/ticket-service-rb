require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context "associations" do
    it { should belong_to(:ticketable)}
  end

  context 'validations' do
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:code) }
  end
end
