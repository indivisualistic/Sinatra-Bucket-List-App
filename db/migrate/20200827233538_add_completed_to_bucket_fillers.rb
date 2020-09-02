class AddCompletedToBucketFillers < ActiveRecord::Migration[6.0]
  def change
    add_column :bucket_fillers, :completed, :boolean
  end
end
