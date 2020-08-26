class AddArriveByToBucketFillers < ActiveRecord::Migration[6.0]
  def change
    add_column :bucket_fillers, :arrive_by, :integer
    

  end
end
