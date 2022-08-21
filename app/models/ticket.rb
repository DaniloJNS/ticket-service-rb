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
class Ticket < ApplicationRecord
  belongs_to :ticketable, polymorphic: true
  validates :price, :code, presence: true
end
