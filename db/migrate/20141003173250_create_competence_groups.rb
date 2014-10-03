class CreateCompetenceGroups < ActiveRecord::Migration
  def up
    create_table :competence_groups do |t|
      t.string :name
      t.integer :position
      t.boolean :visible, default: true
      t.references :color, index: true

      t.timestamps
    end

    CompetenceGroup.create(name: "Планирование", position: 1040, visible: true, color_id: 1)
    CompetenceGroup.create(name: "Сборка", position: 1041, visible: true, color_id: 2)
    CompetenceGroup.create(name: "Исполнение", position: 1042, visible: true, color_id: 3)
    CompetenceGroup.create(name: "Обеспечение", position: 1043, visible: true, color_id: 4)
    CompetenceGroup.create(name: "Управление", position: 1044, visible: true, color_id: 5)
  end

  def down
    drop_table :competence_groups
  end
end
