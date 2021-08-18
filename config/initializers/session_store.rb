if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_tracking_app', domain: 'tracking-app-api.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_tracking_app'
end
