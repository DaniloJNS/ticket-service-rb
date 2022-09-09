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
class TicketSerializer < ActiveModel::Serializer
  attributes :code
  attributes :price
end
