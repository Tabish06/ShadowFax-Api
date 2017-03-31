require 'httparty'
require 'logger'
module ShadowfaxApi
  class << self
    def logger
      @logger ||= begin
        logger= Logger.new(STDOUT)
        logger.level = Logger::WARN
        logger
      end
    end

    def logger=(logger)
      @logger=logger
    end

    def get_servicable_pincodes
      response = send_request(url('serviceable_pincodes'),respond: 'requests')
    end

    def check_serviceable_pincode(pincode)
      response = send_request(url('check_serviceable_pincodes',pincode.to_s))
    end

    def get_delivery_details(awb_number)
      response = send_request(url(awb_number))
    end

    def cancel_delivery_request(data)
      send_request(url('cancel_order'),method: :put,data: data)
    end

    def create_package(data)
      send_request(url,method: :post,data: data)
    end

    def get_bulk_query(data)
      send_request(url('bulk_query'),method: :post,data: data)
    end

    private
    def url(*args)
      args.size == 0 ? Configuration.config[:url] :
        "#{Configuration.config[:url]}/" + args.join("/")
    end

    def send_request(url,method: :get,data: nil,respond: nil)
      options = {headers: headers}
      options[:body] = data.to_json if data
      response = HTTParty.send(method,url,options)
      logger.debug(response.to_s)
      if respond.present?
        response[respond] || Exception.raise_exception(response)
      else
        JSON.parse(response.body)
      end
    end

    def headers
      @headers ||= {'Authorization' => "Token #{Configuration.config[:key]}", 'Content-Type' => 'application/json'}.freeze
    end
  end
end