class AddDescriptionToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :description, :string
  end
end
