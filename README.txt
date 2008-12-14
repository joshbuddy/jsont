= JsonT

== DESCRIPTION:

Port of javascript JsonT transformation library. http://goessner.net/articles/jsont/

== FEATURES/PROBLEMS:

Conforms to most of the JsonT spec minus the javascript function ability. (Have to use Proc's instead of javascript function)

== SYNOPSIS:

Jsont.new({'self' = > '<div>{$.test}</div>', 'test' = > '<p>{$.x} {$.y}</p>'}).transform({'test' = > {'x' = > 1, 'y' = > 2}})
= > <div><p>1 2</p></div>

Jsont.new({'self' = > '<div>{$.test}</div>', 'test' = > Proc.new{|t, opts| t['x']+t['y']}}).transform({'test' = > {'x' = > 1, 'y' = > 2}})
= > <div>3</div>

== INSTALL:

sudo gem install jsont
