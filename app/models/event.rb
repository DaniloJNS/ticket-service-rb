class Event < ApplicationRecord
  has_many :tickets, as: :ticketable
end