worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)

preload_app true
# ...
before_fork do |server, worker|
  # other settings
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end
end

after_fork do |server, worker|
  # other settings
  if defined?(ActiveRecord::Base)
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool']            =   ENV['DB_POOL'] || 20
    ActiveRecord::Base.establish_connection(config)
  end
end




timeout 15

