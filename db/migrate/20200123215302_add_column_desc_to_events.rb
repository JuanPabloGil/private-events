class AddColumnDescToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :desc, :string
  end
end
