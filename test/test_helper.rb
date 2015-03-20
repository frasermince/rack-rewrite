require 'rubygems'
require 'bundler/setup'

Bundler.require :default, :development

require 'test/unit'

class Test::Unit::TestCase
end

def rack_env_for(url, options = {})
  components = url.split('?')
  {'PATH_INFO' => components[0], 'QUERY_STRING' => components[1] || ''}.merge(options)
end

def supported_status_codes
  [:r301, :r302, :r303, :r307]
end

class ZeroTest < Test::Unit::TestCase
  def assert(test, msg= nil)
    if test.class == Fixnum && test.zero?
      super(false)
    end
    if msg.nil?
      super(test)
    else
      super(test, msg)
    end
  end
end
