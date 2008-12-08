require 'rubygems'

DEPENDENCIES = %w(dm-core dm-aggregates dm-migrations dm-serializer dm-timestamps dm-validations dm-cli dm-is-tree dm-observer dm-types)

DEPENDENCIES.each do |lib|
  gem lib, '0.9.8'
  require lib
end
