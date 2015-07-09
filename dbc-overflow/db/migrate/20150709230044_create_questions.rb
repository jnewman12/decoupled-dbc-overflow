class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :title
    	t.string :content
    	t.references :user, index: true, foreign_key: true
    	t.integer :vote_count, default: 0

    	t.timestamps
    end
  end
end
