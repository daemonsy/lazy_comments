require 'active_record'

RSpec.configure do |config|
  config.around do |test|
    ActiveRecord::Base.transaction do
      test.run
      raise ActiveRecord::Rollback
    end
  end
end