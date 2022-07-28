class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author
      t.integer :customer_id, foreign_key: true
      t.integer :building_id, foreign_key: true
      t.integer :battery_id, foreign_key: true
      t.integer :column_id, foreign_key: true
      t.integer :elevator_id, foreign_key: true
      t.integer :employee_id, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :result
      t.text :report
      t.string :status

      t.timestamps
    end
  end
end
