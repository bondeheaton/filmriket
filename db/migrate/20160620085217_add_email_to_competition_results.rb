class AddEmailToCompetitionResults < ActiveRecord::Migration
  def change
    add_column :competition_results, :email, :string
  end
end
