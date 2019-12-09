require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Streamelements < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'tips:write'.freeze

      option :name, "streamelements"

      option :client_options, {
        site: 'https://api.streamelements.com',
        authorize_url: '/oauth2/authorize',
        token_url: '/oauth2/token'
      }

      option :access_token_options, {
        header_format: 'Bearer %s',
        param_name: 'access_token'
      }

      option :authorize_options, [:scope]

      uid do
        raw_info['streamelements']['id']
      end

      info do
        {
          display_name: raw_info['streamelements']['username'],
          name: raw_info['streamelements']['displayName']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= get_raw_info
      end

      def get_raw_info
        uri = URI("https://api.streamelements.com/kappa/v2/channels/me")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        resp = http.get(uri.path, {'Authorization'=>"OAuth #{access_token.token}"})
        data = JSON.parse(resp.body)
        data["id"] = data.delete("_id")
        {"streamelements" => data}
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
      end

      def callback_url
        return options[:redirect_uri] unless options[:redirect_uri].nil?
        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ''].include?(request.params[k.to_s])
          end
          params[:scope] = params[:scope] || DEFAULT_SCOPE
        end
      end
    end
  end
end
