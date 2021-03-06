class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'.freeze

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    response = @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ENV['GITHUB_TOKEN']}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end

    JSON.parse(response.body)
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
