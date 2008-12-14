require "rubygems"
require 'lib/jsont.rb'
require 'json'
describe "JsonT with procs" do
  
  it "should transform" do
    JsonT.new(
      {'self' => '<div>{$.test}</div>', 'test' => Proc.new{|t, opts| t['x']+t['y']}}
    ).transform(
      {'test' => {'x' => 1, 'y' => 2}}
    ).should == '<div>3</div>'
  end
  
end