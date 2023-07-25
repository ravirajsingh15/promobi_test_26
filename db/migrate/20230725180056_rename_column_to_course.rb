class RenameColumnToCourse < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :description, :subject
  end
end
