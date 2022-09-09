# == Schema Information
#
# Table name: tickets
#
#  id              :uuid             not null, primary key
#  code            :string           not null
#  price           :float
#  status          :integer          default(0)
#  ticketable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ticketable_id   :bigint           not null
#
# Indexes
#
#  index_tickets_on_ticketable  (ticketable_type,ticketable_id)
#
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
