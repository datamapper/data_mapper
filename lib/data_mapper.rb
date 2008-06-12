require 'rubygems'

DEPENDENCIES = %w(dm-core dm-aggregates dm-migrations dm-serializer dm-timestamps dm-validations)

DEPENDENCIES.each do |lib|
  gem lib
  require lib
end