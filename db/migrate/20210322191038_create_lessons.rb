class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :user_id
      t.text :content
      t.text :topic

      t.timestamps
    end
  end
end
