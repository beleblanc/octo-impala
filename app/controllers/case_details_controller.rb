class CaseDetailsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_case_detail, only: [:edit,:update, :show, :destroy]


  def index
    #if current_user.has_role?(:admin) || current_user.has_role?(:super_admin)
    #  @case_details = CaseDetail.includes(:status,:constituency).all
    #else
    #  @case_details = CaseDetail.includes(:status,:constituency).where(:user_id => current_user.id)
    #end

    respond_to do |format|
      format.html
      format.json {render json: CasesDatatable.new(view_context)}
    end
  end

  def show

  end

  def new
    @case_detail = CaseDetail.new()
    @case_detail.date_trial_commenced = params[:date_trial_commenced] if params[:date_trial_commenced].present?
    #
    @case_detail.accuseds.build
    @case_detail.complainants.build
  end

  def create
    @case_detail = CaseDetail.new(params[:case_detail])
    respond_to do |format|
      if @case_detail.save
        format.html {redirect_to @case_detail, notice:"Case Successfully created"}

      else
        format.html {render action: "new"}
      end
    end


  end

  def edit
  end

  def update
    if @case_detail.update_attributes(params[:case_detail])
      redirect_to @case_detail, notice: "Case was successfully updated"
    else
      render action: :edit
    end

  end

  def destroy
    @case_detail.destroy
    
    redirect_to case_details_path, notice: "Case was successfully deleted"
  end

  private

  def find_case_detail
    @case_detail = CaseDetail.find(params[:id])

    unless (current_user.has_role?(:admin) || current_user.has_role?(:super_admin)) || (@case_detail.user_id == current_user.id)
      redirect_to case_details_path, alert: "You are not allowed to view or alter this case"
    end
  end
end
