class ExportController < ApplicationController
  before_filter :set_book

  def html
    @html = HtmlExporter.new
    @book.export @html

    render_without_layout
  end

  def text
    text = TextExporter.new
    @book.export text

    render_export text
  end

  def textile
    textile = TextileExporter.new
    @book.export textile

    render_export textile
  end

  def yaml
    yaml = YamlExporter.new
    @book.export yaml

    render_export yaml
  end

  private

  def render_export(txt)
    headers['Content-Type'] = 'text/plain'
    render_text txt.to_s
  end

  def set_book
    @book = Book.find params[:id]
  end

end

