class CreateGraffitis < ActiveRecord::Migration
  def self.up
    create_table :graffitis do |t|
      t.string :textdata

      t.timestamps
    end
  end

  def self.down
    drop_table :graffitis
  end
end
