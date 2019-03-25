module IdentityMind
  class Entity < OpenStruct
    def initialize(json_payload)
      super(JSON.parse(json_payload, symbolize_names: true))
    end

    class << self
      def path
        "/im/#{to_s.split('::')[1..-1].map!(&:downcase).join('/')}"
      end

      def create(params)
        new(IdentityMind.post(path, body: params.to_json).body)
      end

      def fetch(transaction_id)
        new(IdentityMind.get("#{path}/#{transaction_id}").body)
      end
    end
  end
end
