class KeyService
  def initialize(username:)
    @username = username
  end

  def cas_attributes
    response = RestClient.get(
      ENV['CAS_URL'] + "/api/#{ENV['CAS_ACCESS_TOKEN']}/user/attributes?email=#{@username}",
      accept: :json
    )
    JSON.parse(response)
    # Sample output
    # {"relayGuid"=>"F167605D-94A4-7121-2A58-8D0F2CA6E026",
    #  "ssoGuid"=>"F167605D-94A4-7121-2A58-8D0F2CA6E026",
    #  "firstName"=>"Fake",
    #  "lastName"=>"User",
    #  "theKeyGuid"=>"F167605D-94A4-7121-2A58-8D0F2CA6E026",
    #  "email"=>"fake.user@example.com"}
  end
end