# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_phonebook_session',
  :secret      => '975063c25fbb8fa117ba6c714e0b7592935af1e5877721760df2f664e036e61fbda05dbcc84190d257f58249b292b72b962b56f225c36b8e9abbf9cebbfe4d0c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
