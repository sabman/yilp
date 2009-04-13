require 'rubygems'
require "open-uri"
require "active_support"
module YILP
  class YILP      
    APP_ID = ENV["RAILS_ENV"].nil? ? 
      YAML::load_file("./config/yilp_appid.yml")["appid"]["fallback"] : 
      YAML::load_file("./config/yilp_appid.yml")["appid"][ENV["RAILS_ENV"]] 
    
    @@lang_hash = {
      :French => 'fr',
      :German => 'de',
      :Italian => 'de',
      :Dutch => 'nl',
      :Greek => 'el',
      :Spanish => 'es',
      :Portuguese => 'pt', 
      :Arabic => 'ar', 
      :Hebrew => 'he', 
      :Russian => 'ru', 
      :Chinese => 'zh', 
      :Japanese => 'ja', 
      :Hindi => 'hi',
      :Urdu => 'ur', 
      :Sanskrit => 'sa'
    }

    @@baseurl = "http://where.yahooapis.com/v1"
    
    def self.find(query, options={})
      if query.is_a?(Fixnum)  # /place/{woeid}
        valid_keys = [:neighbors, :parent, :ancestors, :belongtos, :siblings, :children]
        options.assert_valid_keys(valid_keys)
        url = "place/#{query}"
        valid_keys.find { |k| url += "/#{k.to_s}" if options[k] }
        url += "?appid=#{APP_ID}"
      else  # /places.q('query')
        valid_keys = [:lang]
        options.assert_valid_keys(valid_keys)
        url = "places.q(#{URI.encode(query)})"
        url += "?appid=#{APP_ID}"
        url += "&lang=#{lang(options[:lang])}" if options[:lang]
      end    
      Hash.from_xml(open("#{@@baseurl}/#{url}"))      
    end
    
    def self.placetypes
      # http://where.yahooapis.com/v1/placetypes?appid=RKxL3NrV34Fwy2Xx2IRhxKz_cy4ESJWC9QUyr45ZMdnj85FXjIGs.yrUdBTQyXWFZu8-      
      url = "placetypes?appid=#{APP_ID}"
      Hash.from_xml(open("#{@@baseurl}/#{url}"))    
    end
  
    def self.lang(lang)
      language = @@lang_hash[lang.to_s.capitalize.to_sym]
    end       
    
  end
end