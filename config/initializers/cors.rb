Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: %i[get post put patch delete options head], credentials: true
  end

  allow do
    origins 'https://tracking-app-api.herokuapp.com'
    resource '*', headers: :any, methods: %i[get post put patch delete options head], credentials: true
  end
end