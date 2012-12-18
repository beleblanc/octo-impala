  # RailsAdmin config file. Generated on August 21, 2012 11:14
# See github.com/sferik/rails_admin for more informations



RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['MOJ CM', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  config.authorize_with :cancan
  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  config.excluded_models = [Accused, CaseDetail, Complainant]

  # Add models here if you want to go 'whitelist mode':
  #config.included_models = [ Charge,  Constituency, Judge, Prosecutor, Region, Relation, User]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Accused do
  #   # Found associations:
  #     configure :relation, :belongs_to_association 
  #     configure :case_detail, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :surname, :string 
  #     configure :sex, :string 
  #     configure :date_of_birth, :date 
  #     configure :known_to_complainant, :boolean 
  #     configure :relation_id, :integer         # Hidden 
  #     configure :case_detail_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model CaseDetail do
  #   # Found associations:
  #     configure :prosecutor, :belongs_to_association 
  #     configure :judge, :belongs_to_association 
  #     configure :region, :belongs_to_association 
  #     configure :constituency, :belongs_to_association 
  #     configure :accuseds, :has_many_association 
  #     configure :complainants, :has_many_association 
  #     configure :charges, :has_and_belongs_to_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :prosecutor_id, :integer         # Hidden 
  #     configure :judge_id, :integer         # Hidden 
  #     configure :rcci, :string 
  #     configure :court_case_number, :string 
  #     configure :court_type, :integer 
  #     configure :date_of_offence, :date 
  #     configure :region_id, :integer         # Hidden 
  #     configure :constituency_id, :integer         # Hidden 
  #     configure :date_reported, :date 
  #     configure :date_submitted, :date 
  #     configure :action_taken, :integer 
  #     configure :status, :integer 
  #     configure :comment, :text 
  #     configure :date_trial_commenced, :date 
  #     configure :date_trial_concluded, :date 
  #     configure :judgment, :string 
  #     configure :sentence, :string 
  #     configure :reason_for_acquittal, :text 
  #     configure :judge_remarks, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Charge do
  #   # Found associations:
  #     configure :case_details, :has_and_belongs_to_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Complainant do
  #   # Found associations:
  #     configure :case_detail, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :surname, :string 
  #     configure :sex, :string 
  #     configure :date_of_birth, :date 
  #     configure :case_detail_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Constituency do
  #   # Found associations:
  #     configure :region, :belongs_to_association 
  #     configure :case_details, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :region_id, :integer         # Hidden   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Judge do
  #   # Found associations:
  #     configure :case_details, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :surname, :string 
  #     configure :sex, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Prosecutor do
  #   # Found associations:
  #     configure :case_details, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :surname, :string 
  #     configure :sex, :string 
  #     configure :region_id, :integer   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Region do
  #   # Found associations:
  #     configure :case_details, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Relation do
  #   # Found associations:
  #     configure :accuseds, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

  config.model Role do

      configure :users do
        inverse_of :roles
      end
      # Found associations:
      # Found columns:
      #  configure :id, :integer
      #  configure :email, :string
      #  configure :password, :password         # Hidden
      #  configure :password_confirmation, :password         # Hidden
      #  configure :reset_password_token, :string         # Hidden
      #  configure :reset_password_sent_at, :datetime
      #  configure :remember_created_at, :datetime
      #  configure :sign_in_count, :integer
      #  configure :current_sign_in_at, :datetime
      #  configure :last_sign_in_at, :datetime
      #  configure :current_sign_in_ip, :string
      #  configure :last_sign_in_ip, :string
      #  configure :created_at, :datetime
      #  configure :updated_at, :datetime   #   # Sections:
      #list do; end
      #export do; end
      #show do; end
      #edit do; end
      #create do; end
      #update do; end
    end

  config.model User do

    list do
      configure :roles do

      end

    end
    # Found associations:
    # Found columns:
    #  configure :id, :integer
    #  configure :email, :string
    #  configure :password, :password         # Hidden
    #  configure :password_confirmation, :password         # Hidden
    #  configure :reset_password_token, :string         # Hidden
    #  configure :reset_password_sent_at, :datetime
    #  configure :remember_created_at, :datetime
    #  configure :sign_in_count, :integer
    #  configure :current_sign_in_at, :datetime
    #  configure :last_sign_in_at, :datetime
    #  configure :current_sign_in_ip, :string
    #  configure :last_sign_in_ip, :string
    #  configure :created_at, :datetime
    #  configure :updated_at, :datetime   #   # Sections:
    #list do; end
    #export do; end
    #show do; end
    #edit do; end
    #create do; end
    #update do; end
  end
end
