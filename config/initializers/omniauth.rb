OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '791214076127-fktfo6mbcep5hv8oug9kq1gc9lglrrb5.apps.googleusercontent.com', 'dos727aFQQRgUCi5wtl4GdD6', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},skip_jwt: true}
end