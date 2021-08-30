class ArticleSpider < Kimurai::Base
  @name = 'articles_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    crawl!
  end

  def parse(response, _url:, _data: {})
    column_list = response.css('div.eprz4kh0') + response.css('div.e1wpk8si0')
    column_priority = 1

    column_list.each do |column|
      new_c = Column.where(id: column_priority).first_or_create

      next if column.attr('class') == 'css-6ey0mg eprz4kh0'

      column.css('div.e1yv2jhn0').each_with_index do |article, ai|
        item = {}
        item[:title] = article.css('h3').text
        item[:url] = "https://www.economist.com#{article.css('a').attr('href').value}"
        item[:img_url] = article.css('img').blank? ? nil : article.css('img').attr('src').value
        item[:description] = article.css('p.e1smrlcj0').blank? ? nil : article.css('p.e1smrlcj0').text
        item[:priority] = ai + 1
        item[:column_id] = new_c.id

        Article.where(item).first_or_create
      end

      column_priority += 1 unless column.css('div.e1yv2jhn0').blank?
    end
  end
end
