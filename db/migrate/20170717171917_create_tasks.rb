class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.date :date
      t.boolean :status

      t.timestamps
    end
  end
end
