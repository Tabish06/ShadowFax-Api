module ShadowfaxApi
  class Exception < ::Exception
    def self.raise_exception(exception_response)
      new(exception_response)
    end
  end
end