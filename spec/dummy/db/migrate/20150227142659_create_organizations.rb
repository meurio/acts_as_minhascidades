class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :avatar

      t.timestamps
    end
  end
end
