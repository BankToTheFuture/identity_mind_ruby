module IdentityMind
  class ResponseError < StandardError
    attr_reader :body, :code, :error_message

    def initialize(body, code)
      @code = code
      @body = body
      @error_message = extract_error_message(body)

      super(
        ["IdentityMind responded with status #{code}", @error_message]
          .compact.join(' => ')
      )
    end

    def extract_error_message(body)
      JSON.parse(body)['error_message']
    rescue JSON::ParserError
      nil
    end
  end
end
