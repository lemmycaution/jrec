require 'oj'
require 'uri'
require 'yaml'
require 'pg/em'
require 'pg/em/connection_pool'
require 'jrec/core_ext/hash'
require 'jrec/core_ext/string'


module Jrec
  module PG
      
    Oj.default_options = { time_format: :ruby, mode: :compat }

    
    def exec_func func_name, *params
      sql = "SELECT jrec_#{func_name}(#{ (params.length-1).times.inject("$1"){ |m,i| "#{m},$#{ i + 2 }"} })"
      exec_params sql, params
    end
    
    def exec_params sql, params = []
      result = pg.exec_params(sql, params)
      json = result.values.flatten.first
      result.clear
      json
    end
    
    ##
    # :singleton method
    # holds db connection

    def pg 
      @@connection_pool ||= ::PG::EM::ConnectionPool.new(config)
    end
      
      
    ##
    # :singleton method
    # parses database url
      
    def config 
      @@config ||= begin
        
        if File.exists?(config_file)
          db = YAML.load(config_file)[env]
        elsif ENV['DATABASE_URL']
          db = URI.parse(ENV['DATABASE_URL'])
        else
          raise "Database configuration not found"  
        end
        
        config = {
          dbname: db.path[1..-1],
          host: db.host,
          port: db.port,
          size: ENV['DB_POOL_SIZE'] || 5,          
          async_autoreconnect: ENV['DB_ASYNC_AUTO_RECONNECT'] || true,
          connect_timeout: ENV['DB_CONN_TIMEOUT'] || 60,
          query_timeout: ENV['DB_QUERY_TIMEOUT'] || 30,
          on_autoreconnect: proc { |pg| pg.exec "SELECT plv8_startup();" rescue nil },
          on_connect: proc { |pg| pg.exec "SELECT plv8_startup();" rescue nil }
        }
        config[:user] = db.user if db.user
        config[:password] = db.password if db.password
        config
      end
    end
    
    def config_file
      ENV['DATABASE_CONFIG_FILE'] || "#{Jrec.root}/config/database.yml"
    end
    
    def env
      ENV['RACK_ENV'] || "development"
    end
    
  end
  
end
