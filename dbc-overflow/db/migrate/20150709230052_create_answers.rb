class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.text :content
    	t.references :user, index: true, foreign_key: true
    	t.references :question, index: true, foreign_key: true
    	t.integer :vote_count, default: 0

    	t.timestamps
    end
  end
end
