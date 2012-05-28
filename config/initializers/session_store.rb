# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dinnerlunchmonster_session',
  :secret      => 'b68067171e8e641d58709c61275aff05003aa57873ddbf71beb0c501b0ed43ffea0c00fb23e03cd6c15c1fad317e8004408497b282cbe6f10e6542b5e57283ab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
