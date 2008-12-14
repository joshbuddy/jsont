require "rubygems"
require 'lib/jsont.rb'
require 'json'
describe "JsonT with arrays" do

  it "should transform" do
    JsonT.new(
      JSON.parse('{ "self": "<table><tr>{$}</tr></table>","self[*]": "<td>{$}</td>" }')
    ).transform(
      JSON.parse('[1,2]')
    ).should == '<table><tr><td>1</td><td>2</td></tr></table>'
  end

end