class CreateSonglikes < ActiveRecord::Migration[5.1]
  def change
    create_table :songlikes do |t|
      t.integer :count
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
