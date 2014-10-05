class CreateCompetenceLevels < ActiveRecord::Migration
  def up
    create_table :competence_levels do |t|
      t.integer :level
      t.text :description
      t.integer :points, default: 0
      t.boolean :visible, default: true
      t.references :competence, index: true

      t.timestamps
    end

    Competence.select(:id).distinct.each do |c|
      (1..5).each do |level|
        CompetenceLevel.create(level: level, competence_id: c.id)
      end
    end
  end

  def down
    drop_table :competence_levels
  end
end
