#!/usr/bin/env ruby
require 'pathname'
require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'

PACKAGE_VERSION = '0.9.1'

PACKAGE_FILES = [
  'README',
  'lib/**/*.rb',
].collect { |pattern| Pathname.glob(pattern) }.flatten.reject { |path| path.to_s =~ /(\/db|Makefile|\.bundle|\.log|\.o)\z/ }

PROJECT = "data_mapper"

DEPENDENCIES = %w(data_objects do_mysql do_postgres do_sqlite3 dm-core dm-aggregates dm-migrations dm-serializer dm-timestamps dm-validations)


gem_spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = PROJECT
  s.summary = "An Object/Relational Mapper for Ruby"
  s.description = "Faster, Better, Simpler."
  s.version = PACKAGE_VERSION

  s.authors = "Sam Smoot"
  s.email = "ssmoot@gmail.com"
  s.rubyforge_project = PROJECT
  s.homepage = "http://datamapper.org"

  s.files = PACKAGE_FILES.map { |f| f.to_s }

  s.require_path = "lib"
  s.requirements << "none"
  
  DEPENDENCIES.each do |lib|
    s.add_dependency lib, ">= #{PACKAGE_VERSION}"
  end

  s.has_rdoc = false
end

Rake::GemPackageTask.new(gem_spec) do |p|
  p.gem_spec = gem_spec
  p.need_tar = true
  p.need_zip = true
end

WINDOWS = (RUBY_PLATFORM =~ /win32|mingw|bccwin|cygwin/) rescue nil
SUDO    = WINDOWS ? '' : ('sudo' unless ENV['SUDOLESS'])

desc "Install #{PROJECT}"
task :install => :package do
  sh %{#{SUDO} gem install --local pkg/#{PROJECT}-#{PACKAGE_VERSION}}
end