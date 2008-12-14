require "rubygems"
require 'lib/jsont.rb'
require 'json'
describe "JsonT with a multi-dimensional array" do

  it "should transform" do
    JsonT.new(
      JSON.parse('{ "self": "<table>\n{$}\n</table>", "self[*]": "<tr>{$}</tr>\n", "self[*][*]": "<td>{$}</td>" }')
    ).transform(
      JSON.parse('[[1,2],[3,4]]')
    ).should == "<table>\n<tr><td>1</td><td>2</td></tr>\n<tr><td>3</td><td>4</td></tr>\n\n</table>"
  end
  
end