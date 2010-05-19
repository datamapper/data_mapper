require 'rubygems'

DEPENDENCIES = %w[
  dm-core
  dm-aggregates
  dm-constraints
  dm-migrations
  dm-transactions
  dm-serializer
  dm-timestamps
  dm-validations
  dm-types
]

DEPENDENCIES.each do |lib|
  gem lib, '1.0.0.rc2'
  require lib
end
