#!/usr/bin/env ruby
require 'pathname'
require 'rubygems'
require 'rake'

gems = %w(dm-core dm-aggregates dm-migrations dm-serializer dm-timestamps dm-validations dm-cli dm-is-tree dm-observer dm-types)

AUTHOR = "Sam Smoot"
EMAIL  = "ssmoot@gmail.com"
GEM_NAME = "data_mapper"
GEM_VERSION = "0.9.4"
GEM_DEPENDENCIES = [["dm-core", GEM_VERSION], *gems.collect { |g| [g, GEM_VERSION] }]
GEM_CLEAN = ['**/*.{gem,DS_Store}', '*.db', "doc/rdoc", ".config", "**/coverage", "cache", "lib/merb-more.rb"]
GEM_EXTRAS = { :has_rdoc => false }

PROJECT_NAME = "datamapper"
PROJECT_URL  = "http://datamapper.org"
PROJECT_DESCRIPTION = "Faster, Better, Simpler."
PROJECT_SUMMARY = "An Object/Relational Mapper for Ruby"


WINDOWS = (RUBY_PLATFORM =~ /win32|mingw|bccwin|cygwin/) rescue nil
SUDO    = WINDOWS ? '' : ('sudo' unless ENV['SUDOLESS'])

desc "Install #{GEM_NAME}"
task :install => :package do
  sh %{#{SUDO} gem install --local pkg/#{GEM_NAME}-#{GEM_VERSION}}
end

## HOE TASKS

require 'hoe'

@config_file = "~/.rubyforge/user-config.yml"
@config = nil
RUBYFORGE_USERNAME = "unknown"
def rubyforge_username
  unless @config
    begin
      @config = YAML.load(File.read(File.expand_path(@config_file)))
    rescue
      puts <<-EOS
ERROR: No rubyforge config file found: #{@config_file}
Run 'rubyforge setup' to prepare your env for access to Rubyforge
 - See http://newgem.rubyforge.org/rubyforge.html for more details
      EOS
      exit
    end
  end
  RUBYFORGE_USERNAME.replace @config["username"]
end

hoe = Hoe.new(GEM_NAME, GEM_VERSION) do |p|

  p.developer(AUTHOR, EMAIL)

  p.description = PROJECT_DESCRIPTION
  p.summary = PROJECT_SUMMARY
  p.url = PROJECT_URL

  p.rubyforge_name = PROJECT_NAME if PROJECT_NAME

  p.clean_globs |= GEM_CLEAN
  p.spec_extras = GEM_EXTRAS if GEM_EXTRAS

  GEM_DEPENDENCIES.each do |dep|
    p.extra_deps << dep
  end

end
