class RenameReasonForToGroundsFor < ActiveRecord::Migration
  def change
    rename_column :appeals,:reason_for,:grounds_for
  end
end
