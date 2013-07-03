require 'benchmark'
require 'language_pack/shell_helpers'

module Skylight
  extend LanguagePack::ShellHelpers

  def self.instrument(name, *args)
    ret = nil
    time = Benchmark.realtime { ret = yield }
    topic "#{name} : #{time}"

    return ret
  end
  def self.trace(name, *args)
    ret = nil
    time = Benchmark.realtime { ret = yield }
    topic "#{name} : #{time}"

    return ret
  end
end

def skylight
#  vendor_folder = File.expand_path("../../../vendor/skylight/gems/", __FILE__)
#  Dir["#{vendor_folder}/*"].each {|dir| $:.unshift "#{dir}/lib" }
#  require 'skylight'

#  config = Skylight::Config.load(File.expand_path("../../../config/skylight.yml", __FILE__))
#  Skylight::Instrumenter.start!(config)
  yield
#  Skylight::Instrumenter.stop!
end