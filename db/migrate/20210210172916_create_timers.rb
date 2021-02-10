class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.integer :time
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
