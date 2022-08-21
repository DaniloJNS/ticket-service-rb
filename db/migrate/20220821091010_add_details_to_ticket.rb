class AddDetailsToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :code, :string, null: false
    add_column :tickets, :status, :integer, default: 0
  end
end
