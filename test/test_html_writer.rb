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
  
  def test_nested_html
    expected =
      '<!DOCTYPE html>'\
      '<html>'\
      '<head>'\
        '<title>foobar</title>'\
      '</head>'\
      '<body>'\
        '<p>foo</p>'\
        '<p>'\
          '<span>'\
            '<span>'\
              '<span>'\
                '<span>bar</span>'\
              '</span>'\
            '</span>'\
          '</span>'\
        '</p>'\
      '</body>'\
      '</html>'
    assert_equal expected, nested_html
  end
  
  def test_invalid_html
    assert_raises HtmlWriter::InvalidTagError do
      HtmlWriter.new.write do |html|
        html.doctype 5
        html.blah
      end
    end
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
  
  def nested_html
    HtmlWriter.new.write do |html|
      html.doctype 5
      html.head do |head|
        head.title 'foobar'
      end
      html.body do |body|
        body.p 'foo'
        body.p do |p|
          p.span do |span_one|
            span_one.span do |span_two|
              span_two.span { |span_three| span_three.span 'bar' }
            end
          end
        end
      end
    end
  end
end
