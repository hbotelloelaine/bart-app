class RemoveLinkFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :link, :string
  end
end
