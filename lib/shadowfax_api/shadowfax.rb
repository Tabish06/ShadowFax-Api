class ShadowFax
  def self.get_servicable_pincodes(mode,key)
    url = "#{set_url(mode)}/serviceable_pincodes".freeze
    headers = {'Authorization' => "Token #{key}"}
    options = {headers: headers}
    response = HTTParty.get(url,options)
  end

  def self.create_package(mode,key,data)
    url = "#{set_url(mode)}".freeze
    headers = {Authorization: "Token #{key}"}
    options = {headers: headers, body: data.to_json}
    response = HTTParty.post(url,options)
  end

  private
  def self.set_url(mode)
    mode == :production ? 'http://saruman.shadowfax.in/api/v1/clients/requests'.freeze : 'http://saruman.staging.shadowfax.in/api/v1/clients/requests'.freeze
  end
end