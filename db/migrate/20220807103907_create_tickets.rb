class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :tickets, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.float :price

      t.timestamps
    end
  end
end
