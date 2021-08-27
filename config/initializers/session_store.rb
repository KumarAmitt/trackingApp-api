if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_deals_tracker', domain: 'deals-tracker.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_deals_tracker'
end

# Rails.application.config.session_store :cookie_store, key: '_deals_tracker', domain: :all

# Rails.application.config.session_store :active_record_store, :key => '_deals_tracker', domain: :all, tld_length: 3


