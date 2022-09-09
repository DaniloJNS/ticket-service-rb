class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :events, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
