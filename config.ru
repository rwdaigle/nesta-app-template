require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'] || 'development')
require 'rack/contrib'
require 'newrelic_rpm'

if ENV['RACK_ENV'] == 'production'
  use Rack::ShowExceptions
end

ttl = ENV['DEFAULT_TTL'] ? ENV['DEFAULT_TTL'].to_i : 3600
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
  if feed_url = ENV['NESTA_FEED_URL']
    r301 %r{/articles.xml(\?.*)?}, feed_url, :if => Proc.new { |rack_env|
      ENV['RACK_ENV'] == 'production' && rack_env['HTTP_USER_AGENT'] !~ /FeedBurner/
    }
  end
end

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'
run Nesta::App