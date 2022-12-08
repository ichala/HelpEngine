class CreateSearches < ActiveRecord::Migration[7.0]
  enable_extension 'pg_trgm'
  def change
    create_table :searches do |t|
      t.string :user_ip, null: false
      t.string :query, null: false

      t.timestamps
    end
  end
end
