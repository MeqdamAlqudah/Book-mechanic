class AddColumnPhotoToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :photo, :string
  end
end
