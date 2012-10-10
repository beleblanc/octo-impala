class AddIdToCaseDetailsCharges < ActiveRecord::Migration
  def change
    add_column :case_details_charges, :id, :primary_key
    rename_table :case_details_charges, :case_charges

    print "Change Association to has_many, :through in CaseDetail and Charge"
  end
end
