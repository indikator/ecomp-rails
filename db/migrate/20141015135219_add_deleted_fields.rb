class AddDeletedFields < ActiveRecord::Migration
  def change
    add_column :competence_groups, :deleted, :boolean, default: false
    add_column :competences, :deleted, :boolean, default: false
    add_column :competence_levels, :deleted, :boolean, default: false
  end
end
