class CreateThroughTable < ActiveRecord::Migration[5.2]


  def up
    create_table :user_events do |t|
      t.references :user
      t.references :event
      t.timestamps
    end
  end


end
