class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :run_date

      t.timestamps
    end
  end
end
