class RenameCaseDetailChargesColumns < ActiveRecord::Migration
  def change
      rename_column :case_details_charges, :case_details_id, :case_detail_id
      rename_column :case_details_charges, :charges_id , :charge_id

  end
end
