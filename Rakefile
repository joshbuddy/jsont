require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "jsont"
    s.description = s.summary = "Ruby implementation of http://goessner.net/articles/jsont/"
    s.email = "joshbuddy@gmail.com"
    s.homepage = "http://github.com/joshbuddy/jsont"
    s.authors = ['Joshua Hull']
    s.files = FileList["[A-Z]*", "{lib,spec}/**/*"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
desc "Generate documentation"
Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
  rd.rdoc_dir = 'rdoc'
end

require 'rubygems'
require 'spec'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t|
  t.spec_opts ||= []
  t.spec_opts << "--options" << "spec/spec.opts"
  t.spec_files = FileList['spec/*.rb']
end
