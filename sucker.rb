################################## LIB ########################################

require 'json'

class Resource
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def raw
    `curl -s #{@path}`
  end
  def obj
    JSON.restore(raw) if raw.chomp!
  end
  def collection # Specify a collection URI, such as http://example.com/resources/
    Resource.new(@path + '/')
  end
  def method_missing(method, *args, &block)
      return obj.send(method, *args, &block) if Hash.method_defined?(method) || Array.method_defined?(method)
      Resource.new(@path + '/' + method.to_s)
  end
end

class Sucker
  attr_accessor :base_endpoint
  def initialize(base_endpoint)
    @base_endpoint = base_endpoint
  end
  def method_missing(method, *args, &block)
    Resource.new(@base_endpoint + method.to_s)
  end
end

################################## DEMO #######################################

github = Sucker.new('https://api.github.com/');

puts github.repos.secreek.hackatus.commits[0]['commit']['author']
