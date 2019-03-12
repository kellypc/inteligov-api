module RequestHelperSpec
	def json_response
	  JSON.parse(response.body, symbolize_names: true)
	end

	def login(user)
    post api_user_session_path, params:  { email: user.email, password: 'password' }.to_json,
		                            headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

	def get_headers
		client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

		auth_params = {
      'access-token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry,
      'token_type' => token_type
    }

		auth_params
	end
end
