module Byzantine
  module Stores
    class HashStore < BaseStore
      attr_reader :buffer

      def initialize(buffer = {})
        @buffer = buffer
      end

      def set(key, value)
        buffer[key] = value
      end

      def get(key)
        buffer[key]
      end
    end
  end
end
