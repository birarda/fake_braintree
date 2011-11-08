# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
require 'rspec'
require 'fake_braintree'
require 'timecop'
Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each {|f| require f}

Dir.mkdir('tmp') unless Dir.exist?('tmp')
File.new('tmp/braintree_log', 'w').close

RSpec.configure do |config|
  config.mock_with :mocha

  config.include BraintreeHelpers

  config.before { FakeBraintree.clear! }
end
