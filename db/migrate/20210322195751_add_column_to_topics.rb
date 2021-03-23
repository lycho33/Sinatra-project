class AddColumnToTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :topic_id, :integer
    add_column :lessons, :lesson_id, :integer
  end
end
