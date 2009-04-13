require File.dirname(__FILE__) + '/../lib/yilp.rb'
require "pp"
include YILP

describe YILP do
  before do
    @h = Hash.new 
    @valid_place = 'sydney'
    @valid_woid = 1105777
    @invalid_woid = "12dsag@!"
    @invalid_place = "21gdssf32"
  end
  
  after(:each) do
    @h.should_not be(nil)
  end

  it  "should find the  yilp api keys in ./config/yilp_appid.yml" do
    @h = YILP::YILP::APP_ID
    @h = YILP::YILP.find(@valid_place)
  end                                                                   
  
  it "should accept a query string and return a valid hash" do
    @h = YILP::YILP.find(@valid_place)
  end
    
  # /place/{woeid}
  it "should accept a numeric WOEID and return a valid hash" do
    @h = YILP::YILP.find(@valid_woid)
  end
  
  # /place/{woeid}/parent
  it "should accept a numeric WOEID, a parent option and return a valid hash" do
    @h = YILP::YILP.find(@valid_woid, :parent => true)
  end

  # /place/{woeid}/ancestors
  it "should accept a numeric woeid, an ancestors hash and return a valid hash" do
    @h = YILP::YILP.find(@valid_woid, :ancestors => true)
  end

  # /place/{woeid}/neighbors 
  it "should accept a neighbors option" do
    @h = YILP::YILP.find(@valid_woid, :neighbors => true)
  end
  
  # /place/{woeid}/belongtos
  it "should accept a valid WOEID and a belongtos option and return a valid hash of a collection of places that contain a place" do
    @h = YILP::YILP.find(@valid_woid, :belongtos => true)
    @h["places"]["place"].should_not be(nil)
  end
  
  # /place/{woeid}/siblings TODO: siblings may need a spec
  it "should accept a valid WOEID and a siblings option and return a collection of places that are siblings of a place" do
    @h = YILP::YILP.find(@valid_woid, :siblings => true)
    @h["places"]["place"].should_not be(nil)
  end

  # /place/{woeid}/children
  it "should accept a valid WOEID and a children option and return a collection of places that are children of a place." do
    @h = YILP::YILP.find(@valid_woid, :children => true)
    @h["places"]["place"].should_not be(nil)
  end
  
  # /placetypes
  it "should return placetypes" do
    @placetypes = YILP::YILP.placetypes
    @placetypes.should_not be(nil)
    @placetypes["place_types"]["place_type"].should_not be(nil)
  end
  
  it "should deal with internationalized placenames" do
    @h = YILP::YILP.find('Moscow', :lang => :German)
    @h["places"]["place"]["name"].should eql("Moskau")
    @h = YILP::YILP.find('USA', :lang => :French)
    @h["places"]["place"]["name"].should eql("États-Unis")
  end
  
  # http://www.w3.org/TR/REC-html40/struct/dirlang.html#langcodes
  #TODO: it "should accept a valid lang option and return"
  
  it "should have valid key-value pairs for language" do
    YILP::YILP.lang(:French).should eql('fr') 
    YILP::YILP.lang(:German).should eql('de') 
    YILP::YILP.lang(:Italian).should eql('de') 
    YILP::YILP.lang(:Dutch).should eql('nl') 
    YILP::YILP.lang(:Greek).should eql('el')
    YILP::YILP.lang(:Spanish).should eql('es') 
    YILP::YILP.lang(:Portuguese).should eql('pt')  
    YILP::YILP.lang(:Arabic).should eql('ar')  
    YILP::YILP.lang(:Hebrew).should eql('he')  
    YILP::YILP.lang(:Russian).should eql('ru')  
    YILP::YILP.lang(:Chinese).should eql('zh')  
    YILP::YILP.lang(:Japanese).should eql('ja')  
    YILP::YILP.lang(:Hindi).should eql('hi')
    YILP::YILP.lang(:Urdu).should eql('ur') 
    YILP::YILP.lang(:Sanskrit).should eql('sa')
  end
end