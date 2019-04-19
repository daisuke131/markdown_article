module ApplicationHelper
  def qiita_markdown(markdown)
    # binding.pry
    processor = Qiita::Markdown::Processor.new(hostname: "markdown_article.com")
    processor.call(markdown)[:output].to_s
  end
end
