require 'rubygems'

DEPENDENCIES = %w[ dm-core dm-aggregates dm-constraints dm-migrations dm-serializer dm-timestamps dm-validations dm-types ]

DEPENDENCIES.each do |lib|
  gem lib, '0.10.1'
  require lib
end
