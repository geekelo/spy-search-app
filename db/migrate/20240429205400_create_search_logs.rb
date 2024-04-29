class CreateSearchLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :search_logs do |t|
      t.string :query
      t.string :ip_address

      t.timestamps
    end
  end
end
