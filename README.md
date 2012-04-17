# html_writer

a small DSL for writing HTML

## usage

#### ruby

``` ruby
HtmlWriter.new.write do |html|
  html.doctype 5
  html.head do |head|
    head.title 'foobar'
  end
  html.body do |body|
    body.p 'hello, world'
  end
end

#### html

``` html
<!DOCTYPE html>
<html>
<head>
  <title>foobar</title>
</head>
<body>
  <p>hello, world</p>
</body>
</html>

## todo

* support other doctypes besides html5
