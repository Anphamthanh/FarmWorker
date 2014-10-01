# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
FarmWorker::Application.config.secret_key_base = '41abadabe5dde202b173a592639237036df35497dee2cd315caeb69a2ee0ec29b1a720d94cab432cca1deec07768c2f395cd72f070bcdcf97921a72c9c30dd7e'
