class RemoveCourtTypeForAppeal < ActiveRecord::Migration
  def change
    remove_column :appeals,:court_type
  end
end
