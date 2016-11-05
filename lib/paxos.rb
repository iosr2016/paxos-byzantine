require 'paxos/persistance/p_store'
require 'paxos/configuration'

module Paxos
  extend Forwardable

  attr_reader :configuration

  def_delegators :configuration, :data_store, :paxos_store

  def initialize_vars
    @configuration = Configuration.new
  end

  def configure
    yield configuration
  end

  module_function :configure, :configuration, :initialize_vars

  initialize_vars
end
