require "rubygems"
require 'lib/jsont.rb'
require 'json'
describe "JsonT was a hash" do
  
  it "should use $ references" do
    JsonT.new(
      {'self' => '<div>{$.test}</div>', 'test' => '<p>{$.x} {$.y}</p>'}
    ).transform(
      {'test' => {'x' => 1, 'y' => 2}}
    ).should == '<div><p>1 2</p></div>'
  end

  it "should transform" do
    JsonT.new(
      JSON.parse('{ "self": "<table>{pnt}</table>", "pnt": "<tr><td>{pnt.x}</td><td>{pnt.y}</td></tr>" }')
    ).transform(
      JSON.parse('{"pnt": { "x":2, "y":3 }}')
    ).should == '<table><tr><td>2</td><td>3</td></tr></table>'

  end

end