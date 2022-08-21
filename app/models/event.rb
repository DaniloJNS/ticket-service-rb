# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  has_many :tickets, as: :ticketable
end
