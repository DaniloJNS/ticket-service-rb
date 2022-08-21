# == Schema Information
#
# Table name: tickets
#
#  id              :bigint           not null, primary key
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  code            :string           not null
#  status          :integer          default(0)
#  ticketable_type :string           not null
#  ticketable_id   :bigint           not null
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
