class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name
      t.integer :widget_id

      t.timestamps
    end
  end
end
