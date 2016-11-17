require 'socket'
require 'base64'

module Byzantine
  class Connector
    extend Forwardable

    attr_reader :node

    def_delegators :node, :host, :port

    def initialize(node)
      @node = node
    end

    def send(message)
      socket.puts serialize(message)
    end

    private

    def serialize(message)
      Base64.strict_encode64 Marshal.dump(message)
    end

    def socket
      @socket ||= TCPSocket.new host, port
    end
  end
end
