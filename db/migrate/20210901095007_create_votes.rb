class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :joke, null: false, foreign_key: true

      t.timestamps
    end
  end
end
