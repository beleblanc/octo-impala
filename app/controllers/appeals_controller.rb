class AppealsController < ApplicationController
  before_filter :find_appeal, only: [:show,:edit,:update,:destroy]
  def index

  end

  def show
  end

  def edit
  end

  def new
    @appeal = Appeal.new
    @appeal.case_detail_id = params[:case_detail_id] if params[:case_detail_id].present?
    @appeal.accused_id = params[:accused_id] if params[:accused_id].present?

  end

  def create
    @appeal = Appeal.new(params[:appeal])

    respond_to  do |format|
      if @appeal.save!
        @appeal.case_detail.court_type_id = CourtType.find_by_name("Appellate Court").id
        @appeal.case_detail.save!
        format.html {redirect_to case_detail_path(@appeal.case_detail), notice:"Case Appeal was successfully created!"}
      else
        format.html{render action: "new"}
      end
    end
  end

  def update
    if @appeal.update_attributes(params[:appeal])
      redirect_to @appeal.case_detail, notice: "Appeal was successfully updated"
    else
      render action: :edit
    end
  end

  def destroy
    @appeal.destroy
    redirect_to @appeal.case_detail,:notice => "Case appeal was successfully destroyed"
  end

  private

  def find_appeal
    @appeal = Appeal.find(params[:id])
  end
end
