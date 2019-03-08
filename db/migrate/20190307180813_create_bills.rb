class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :author
      t.string :ext_id
      t.string :kind
      t.string :number
      t.string :year
      t.string :status
      t.text :description
      t.string :link
      t.string :introduction_date

      t.timestamps
    end
  end
end
