module ApplicationHelper
  def qiita_markdown(markdown)
    processor = Qiita::Markdown::Processor.new(hostname: "qoota.com")
    processor.call(markdown)[:output].to_s
  end
end
