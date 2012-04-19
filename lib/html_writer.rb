class HtmlWriter
  VERSION = '0.2.0'
  
  DEFAULT_DOCTYPE = 5
  
  VALID_TAGS = {
    5 => [
      :a, :abbr, :address, :area, :article, :aside, :audio,
      :b, :base, :bdi, :bdo, :big, :blockquote, :body, :br, :button,
      :canvas, :caption, :cite, :code, :col, :colgroup, :command,
      :datalist, :dd, :del, :details, :dfn, :div, :dl, :dt,
      :em, :embed,
      :fieldset, :figcaption, :figure, :footer, :form,
      :h1, :h2, :h3, :h4, :h5, :h6, :head, :header, :hr,
      :i, :iframe, :img, :input, :ins,
      :keygen, :kbd,
      :label, :legend, :li, :link,
      :map, :mark, :menu, :meta, :meter,
      :nav, :noscript,
      :object, :ol, :optgroup, :option, :output,
      :p, :param, :pre, :progress,
      :q,
      :rp, :rt, :ruby,
      :s, :samp, :script, :section, :select, :small, :source, :span, :strong,
          :style, :sub, :summary, :sup,
      :table, :tbody, :td, :textarea, :tfoot, :th, :thead, :time, :title, :tr,
          :track,
      :u, :ul,
      :var, :video,
      :wbr
    ]
  }
  
  class InvalidTagError < StandardError; end
  
  def initialize
    @html    = ''
    @doctype = DEFAULT_DOCTYPE
  end
  
  def write
    @html << '<html>'
    yield self
    @html << '</html>'
  end
  
  def write_inline
    yield self
  end
  
  def doctype(doctype)
    @doctype = doctype
    case @doctype
    when 5
      @html = '<!DOCTYPE html>' + @html
    end
  end
  
  def method_missing(name, *args, &block)
    unless valid_tag?(name)
      raise InvalidTagError, "`<#{name}>` is not a valid HTML #{@doctype} tag."
    end
    
    @html << "<#{name}>"
    if block_given?
      yield self
    else
      @html << args.join('')
    end
    @html << "</#{name}>"
  end
  
  private
  
  def valid_tag?(name)
    VALID_TAGS[@doctype].include? name.to_sym
  end
end
