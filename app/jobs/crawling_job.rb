class CrawlingJob < ApplicationJob
  queue_as :default

  def perform(url)
    link = PreviewLink.find_by_url(url)
    unless link.present?
      ogp = OGP::OpenGraph.new(Faraday.get(url)&.body)
      link = PreviewLink.create(url: url, title: ogp.title, description: ogp.description, image: ogp.image.url)
    end
    logger.info "#{link.inspect}"
  end
end
