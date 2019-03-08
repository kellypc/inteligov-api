class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :author
      t.string :ext_id
      t.string :kind
      t.string :number
      t.string :year
      t.string :status
      t.text :description
      t.string :link
      
      t.timestamps
    end
  end
end
