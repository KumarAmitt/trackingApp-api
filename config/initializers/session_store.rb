if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_deals_tracker_app', domain: 'deals-tracker.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_deals_tracker_app'
end

