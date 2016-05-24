PRODUCTION = ENV['RACK_ENV'] == 'production'

require 'roda'
require 'fortitude'
require 'shrine'
require 'bcrypt'
require "shrine/storage/file_system"
require './models.rb'

Shrine.plugin :sequel
Shrine.plugin :rack_file
Shrine.plugin :validation_helpers
Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'),
}

FOLDERS = %w[views models uploaders]

FOLDERS.each do |folder|
  Dir["./#{folder}/**/*.rb" ].each { |file| require file }
end

unless PRODUCTION
  require 'better_errors'
end

class SSeams < Roda
  unless PRODUCTION
    opts[:root] = Dir.pwd
    plugin :static, %w[/html /vendor /images /uploads]
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end

  use Rack::Session::Cookie, key: '_App_session', secret: ENV['SECRET']

  plugin :default_headers, {
    'Content-Type' => 'text/html',
    'X-Frame-Options' => 'sameorigin',
    'X-Content-Type-Options' => 'nosniff',
    'X-XSS-Protection' => '1; mode=block',
  }

  plugin :csrf
  plugin :basic_auth
  plugin :cookies
  plugin :status_handler

  status_handler 403 do
    'You are forbidden from seeing that!'
  end

  status_handler 404 do
    "Uh oh, there doesn't seem to be anything here."
  end

  route do |r|
    Views::Base.delegate = self

    token = request.cookies['auth_token']
    session = Session.where(token: token).first
    current_user = session.user if session&.valid?

    r.root do
      widget Views::Home
    end

    r.is 'signup' do
      widget Views::Login, create: true
    end

    r.on 'login' do
      r.get do
        widget Views::Login
      end

      r.is method: 'post' do
      end
    end

    r.on 'user' do
      r.is method: 'post' do
        params = {
          name: r['name'],
          email: r['email'],
          password: r['password'],
        }

        user = User.create params
        login_user user, r
      end
    end
  end

  def return_to r
    url = session[:return_to] || '/'
    session[:return_to] = nil
    r.redirect url
  end

  def login_user user, r
    s = Session.create token: SecureRandom.hex, user: user

    r.response.set_cookie 'auth_token', {
      value: s.token,
      expires: Time.now + Session::EXPIRE_TIME,
      domain: nil, # look into doing this correctly for prod
    }

    return_to r
  end

  def widget klass, needs = {}
    klass.new(**needs).to_html
  end
end
