class PopulateWorker
  include Sidekiq::Worker

  def perform(*args)
    Article.delete_all
    Column.delete_all

    ArticleSpider.process('https://www.economist.com/')
  end
end
