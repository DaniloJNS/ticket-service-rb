class AddTicketableToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :ticketable, null: false, polymorphic: true
  end
end
