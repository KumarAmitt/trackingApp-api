if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_deals_tracker', domain: 'deals-tracker.herokuapp.com', :same_site => :none, :secure => :true, tld_length: 3
else
  Rails.application.config.session_store :cookie_store, key: '_deals_tracker'
end

# Rails.application.config.session_store :cookie_store, key: '_deals_tracker', domain: :all

# Rails.application.config.session_store :active_record_store, :key => '_deals_tracker', domain: :all, tld_length: 3

# Rails.application.config.session_store :cookie_store, key: '_deals_tracker', domain: :all, :same_site => :none, :secure => :true, :tld_length => 3
