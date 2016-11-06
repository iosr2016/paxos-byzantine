module Paxos
  class Context
    extend Forwardable

    attr_reader :configuration

    delegate node_id: :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def distributed
      @distributed ||= Distributed.new configuration
    end

    def data_store
      @data_store ||= store_factory.create :data
    end

    def session_store
      @session_store ||= store_factory.create :session_store
    end

    def store_factory
      @store_factory ||= StoreFactory.new configuration
    end
  end
end