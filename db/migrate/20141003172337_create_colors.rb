class CreateColors < ActiveRecord::Migration
  def up
    create_table :colors do |t|
      t.string :name
      t.string :first
      t.string :second
      t.string :third

      t.timestamps
    end
    add_index :colors, :name, unique: true

    Color.create(name: 'Green Sea', first: '#16a085', second: '#38e4c2', third: '#92f0de')
    Color.create(name: 'Nephritis', first: '#27ae60', second: '#60db94', third: '#b3eecc')
    Color.create(name: 'Belize hole', first: '#2980b9', second: '#6ab0de', third: '#bedcf0')
    Color.create(name: 'Wisteria', first: '#8e44ad', second: '#ba87d0', third: '#e4d0ed')
    Color.create(name: 'Midnight blue', first: '#2c3e50', second: '#507192', third: '#8aa4be')
    Color.create(name: 'Orange', first: '#f39c12', second: '#f8c573', third: '#fdedd4')
    Color.create(name: 'Pumpkin', first: '#d35400', second: '#ff883a', third: '#ffc6a0')
    Color.create(name: 'Pomegranate', first: '#c0392b', second: '#df7c72', third: '#f2c9c5')
    Color.create(name: 'Asbestos', first: '#7f8c8d', second: '#b5bcbd', third: '#ebeded')
    Color.create(name: '4a86e8', first: '#4a86e8', second: '#86aff0', third: '#c2d6f8')
    Color.create(name: '93c47d', first: '#93c47d', second: '#b7d7a8', third: '#dbebd4')
    Color.create(name: '9fc5e8', first: '#9fc5e8', second: '#bfd8ef', third: '#dfecf8')
    Color.create(name: 'ff9900', first: '#ff9900', second: '#ffbb55', third: '#ffddaa')
    Color.create(name: 'ffd966', first: '#ffd966', second: '#ffe673', third: '#fff380')
  end



  def down
    remove_index :colors, :name
    drop_table :colors
  end
end
