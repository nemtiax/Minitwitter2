require "active_record/connection_adapters/postgresql_adapter"

class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
  alias initialize_without_config_boolean_coercion initialize
  def initialize(connection, logger, connection_parameters, config)
    if config[:prepared_statements] == 'false'
      config = config.merge(prepared_statements: false)
    end
    initialize_without_config_boolean_coercion(connection, logger, connection_parameters, config)
  end
end