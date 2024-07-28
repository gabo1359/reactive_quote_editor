class LineItemsController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date
  before_action :set_line_item, only: %i[edit update destroy]

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = @line_item_date.line_items.new(line_item_params)

    if @line_item.save
      redirect_to @quote, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @line_item.update(line_item_params)
      redirect_to @quote, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item.destroy
    redirect_to @quote, notice: "Item was successfully destroyed."
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:line_item_date_id])
  end

  def line_item_params
    params.require(:line_item).permit(:name, :quantity, :unit_price, :description)
  end

  def set_line_item
    @line_item = @line_item_date.line_items.find(params[:id])
  end
end