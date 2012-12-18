class AppealsController < ApplicationController
  before_filter :find_appeal, only: [:show,:edit,:update,:destroy]

  def show
  end

  def edit
  end

  def new
    @appeal = Appeal.new
  end

  def create
    @appeal = Appeal.new(params[:appeal])

    respond_to  do |format|
      if @appeal.save!
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
