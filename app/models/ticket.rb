class Ticket < ApplicationRecord
  belongs_to :ticketable, polymorphic: true
  validates :price, :code, presence: true
end
