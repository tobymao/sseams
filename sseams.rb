PRODUCTION = ENV['RACK_ENV'] == 'production'

require 'roda'
require 'fortitude'
require 'shrine'
require 'bcrypt'
require "shrine/storage/file_system"
require './models.rb'
require 'mail'

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

Mail.defaults do
  delivery_method :smtp, address: '7seams.com', port: 25
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
  plugin :mailer

  status_handler 404 do
    "Uh oh, there doesn't seem to be anything here."
  end

  route do |r|
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

      r.post do
        user = User.where(email: r['email']).first
        redirect '/login' unless user
        login_user user
      end
    end

    r.is 'logout', method: 'post' do
      r.redirect '/' unless current_user
      request.response.set_cookie 'auth_token', nil
      return_to
    end

    r.on 'user' do
      r.post do
        params = {
          name: r['name'],
          email: r['email'],
          password: r['password'],
        }

        user = User.create params
        login_user user
      end
    end

    r.on 'measurements' do
      authenticate '/measurements'

      measurement = current_user.measurement

      r.get do
        widget Views::Measurements, measurement: measurement
      end

      r.post do
        height = r['feet'].to_i * 12 + r['inches'].to_i

        params = {
          height: height,
          weight: r['weight'],
          neck: r['neck'],
          back: r['back'],
          chest: r['chest'],
          shoulder: r['shoulder'],
          waist: r['waist'],
          arm: r['arm'],
          butt: r['butt'],
          wrist: r['wrist'],
          front_image: r['front_image'],
          back_image: r['back_image'],
          side_image: r['side_image'],
        }

        if measurement
          measurement.update params
        else
          params[:user_id] = current_user.id
          measurement = Measurement.create params
        end

        r.redirect '/shirts'
      end
    end

    r.on 'shirts' do
      authenticate '/shirts'

      r.get do
        widget Views::Shirts
      end

      r.post do
        session[:cart] = r.params.select do |k, v|
          v.to_i > 0
        end

        r.redirect '/shipping'
      end
    end

    r.on 'shipping' do
      authenticate '/shipping'
      address = current_user.address

      r.get do
        widget Views::Shipping
      end

      r.post do
        params = {
          name: r['name'],
          street: r['street'],
          city: r['city'],
          state: r['state'],
          zip: r['zip'],
        }

        if address
          address.update params
        else
          params[:user_id] = current_user.id
          address = Address.create params
        end

        self.class.sendmail '/order', address

        r.redirect '/complete'
      end
    end

    r.on 'complete' do
      widget Views::Complete
    end

    r.mail 'order' do |address|
      from 'orders@sevenseam.com'
      to 'toby.mao@gmail.com'
      subject 'Seven Seams Order Received'
      address.to_json
    end
  end

  def return_to
    url = session[:return_to] || '/'
    session[:return_to] = nil
    request.redirect url
  end

  def current_user
    @current_user ||=
      begin
        token = request.cookies['auth_token']
        session = Session.where(token: token).first
        user = session.user if session&.valid?
        user
      end
  end

  def login_user user
    s = Session.create token: SecureRandom.hex, user: user

    request.response.set_cookie 'auth_token', {
      value: s.token,
      expires: Time.now + Session::EXPIRE_TIME,
      domain: nil, # look into doing this correctly for prod
    }

    return_to
  end

  def authenticate path
    unless current_user
      session[:return_to] = path
      request.redirect '/login'
    end
  end

  def widget klass, needs = {}
    needs[:csrf_tag] ||= csrf_tag
    needs[:request] ||= request
    needs[:current_user] ||= current_user
    klass.new(**needs).to_html
  end
end
