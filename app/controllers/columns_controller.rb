class ColumnsController < ApplicationController
  def index
    @columns = Column.all

    @data = set_columns_data(@columns);
    
    json_response({ columns: @data})
  end

  private

  def set_columns_data(columns)
    cols = {}

    columns.each do |elem|
      cols[elem.id.to_s] = { articles: Article.where(["column_id = ?", elem.id]).order(:priority) }
    end

    cols
  end
end
