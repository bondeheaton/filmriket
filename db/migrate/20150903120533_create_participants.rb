class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :event, index: true
      t.references :club, index: true

      t.timestamps
    end
  end
end
