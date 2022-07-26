# == Schema Information
#
# Table name: events
#
#  id          :uuid             not null, primary key
#  description :text             not null
#  location    :string           not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  has_many :tickets, as: :ticketable
  has_one_attached :image

  validates :name, :description, :location, presence: true
end
