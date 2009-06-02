module FirsthandHelper

  [ :abstract, 
    :author, 
    :description, 
    :keywords, 
    :language, 
    :owner, 
    :robots ].each do | t |

    define_method(t) do | content |
      meta(:name => t, :content => content)
    end
      
  end

  def char_set(set)
    meta(:content => "text/html; charset=#{set}", "http-equiv" => "Content-Type")
  end

  def dublin_core(options)
    tag("link", :href => "http://purl.org/DC/elements/1.0/", :rel => "schema.DC") +
      newline +    
      meta(:name => "DC.Publisher", :content => options[:publisher]) +
      newline +
      meta(:name => "DC.Language", :content => options[:language], :scheme => "rfc1766") +
      newline +
      meta(:name => "DC.Date", :content => options[:date], :scheme => "iso8601") +
      newline +
      meta(:name => "DC.Rights", :content =>  options[:rights])
  end    
  
  def fav_icon
    tag("link", :rel => "icon", :href => "favicon.ico" )
  end

  def google_verify(key)
    meta(:name => "verify-v1", :content => key)
  end

  # Generate your label at http://www.icra.org/
  def irca_label(label)
    tag("link", :rel => "meta", :href => "labels.rdf.xml", :type => "application/rdf+xml", :title => "ICRA labels") +
      newline +
      meta("http-equiv" => "pics-Label", :content => label)
  end

  # Used with the mixin "+round-corners"
  def round_corners
    %{<b class="cn tl"></b><b class="cn tr"></b><b class="cn bl"></b><b class="cn br"></b>}
  end

  private

    # Specialized tag for meta as the default method <tt>tab</tt> converts name
    # to an id  
    def meta(options)
      output = "<meta "
      options.keys.sort { |a, b| a.to_s <=> b.to_s }.each do |key|
        output << " #{key}=\"#{options[key]}\"" if options[key]
      end      
      output << " />"
    end
    
    def newline
     "\n"  
    end

end