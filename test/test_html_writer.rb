require 'html_writer'
require 'test/unit'

class TestHtmlWriter < Test::Unit::TestCase
  def test_basic_html
    expected =
      '<!DOCTYPE html>'\
      '<html>'\
      '<head>'\
        '<title>foo</title>'\
      '</head>'\
      '<body>'\
        '<p>hello, world</p>'\
      '</body>'\
      '</html>'
    assert_equal expected, basic_html
  end
  
  private
  
  def basic_html
    HtmlWriter.new.write do |html|
      html.doctype 5
      html.head do |head|
        head.title 'foo'
      end
      html.body do |body|
        body.p 'hello, world'
      end
    end
  end
end
