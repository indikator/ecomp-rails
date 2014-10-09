class CreateCompetenceKnowskills < ActiveRecord::Migration
  def change
    create_table :competence_knowskills do |t|
      t.string :name
      t.integer :points
      t.references :competence, index: true

      t.timestamps
    end
  end
end
