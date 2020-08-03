class CreateBucketFillers < ActiveRecord::Migration[6.0]
  def change
    create_table :bucket_fillers do |t|
      t.string :bucket_list
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
