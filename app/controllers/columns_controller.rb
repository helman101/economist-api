class ColumnsController < ApplicationController
  def index
    @columns = Column.all

    @data = columns_data(@columns)

    json_response(@data)
  end

  private

  def columns_data(columns)
    cols = []

    columns.each do |elem|
      cols.push({ id: elem.id,
                  articles: Article.select('id, title, description, url, img_url')
                    .where(['column_id = ?', elem.id]).order(:priority).as_json })
    end

    cols
  end
end
