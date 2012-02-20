require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'])
require 'rack/contrib'
require 'newrelic_rpm'

use Rack::ShowExceptions if ENV['RACK_ENV'] == 'development'

ttl = ENV['DEFAULT_TTL'].to_i || 300
use Rack::Cache,
  :verbose     => true,
  :default_ttl => ttl,
  :allow_reload => true,
  :allow_revalidate => true,
  :private_headers => [],
  :metastore   => "memcached://#{ENV['MEMCACHE_SERVERS'] || 'localhost:11211'}/meta",
  :entitystore => "file:tmp/cache/rack/body"

use Rack::ResponseHeaders do |headers|
  headers['Cache-Control'] = "public, max-age=#{ttl}"
end
use Rack::ETag
use Rack::CommonLogger

use Rack::Rewrite do

  # Old ryan's scraps URLs
  # http://ryandaigle.com/articles/2009/8/6/what-s-new-in-edge-rails-cleaner-restful-controllers-w-respond_with
  r301 %r{/articles/(\d{4})/(\d+)/(\d+)/(.+)}, 'http://archives.ryandaigle.com/articles/$1/$2/$3/$4'

  # http://ryandaigle.com/archives/2007/10
  r301 %r{/archives/(\d{4})/(\d+)}, 'http://archives.ryandaigle.com/archives/$1/$2'

  r301 %r{/articles.xml(\?.*)?}, 'http://feeds.feedburner.com/RyansScraps', :if => Proc.new { |rack_env|
    ENV['RACK_ENV'] == 'production' && rack_env['HTTP_USER_AGENT'] !~ /FeedBurner/
  }
end

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'
run Nesta::App