# frozen_string_literal: true

# Check for the necessary keys in ENV variables
def validate_env_key!(key)
  raise StandardError, "Missing required configuration key: #{key}" unless ENV.key?(key)
end

%w[GITHUB_TOKEN ADMIN_EMAIL].map { |key| validate_env_key!(key) } if Rails.env.test? || Rails.env.development?
%w[GITHUB_TOKEN SMTP_USERNAME SMTP_PASSWORD ADMIN_EMAIL].map { |key| validate_env_key!(key) } if Rails.env.production?
