workers Integer(ENV.fetch('WEB_CONCURRENCY', 2))
threads_count = Integer(ENV.fetch('THREAD_COUNT', 5))
threads threads_count, threads_count

rackup DefaultRackup
port 3001
environment ENV.fetch('RACK_ENV', 'production')

if ENV['RACK_ENV'] == 'development'
  localhost_key = File.join('config', 'local-certs', 'localhost-key.pem').to_s
  localhost_crt = File.join('config', 'local-certs', 'localhost.pem').to_s
  # To be able to use rake etc
  ssl_bind '0.0.0.0', 3000, {
    key: localhost_key,
    cert: localhost_crt,
    verify_mode: 'none'
  }
end
