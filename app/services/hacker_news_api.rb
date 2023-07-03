module HackerNewsApi
    module V1
      class Client
        API_ENDPOINT = 'https://hacker-news.firebaseio.com/v0/'.freeze
  
        def top_stories
           request(
            http_method: :get,
            endpoint: "topstories.json"
          )
        end
  
        def find_story(story_id)
          request(
            http_method: :get,
            endpoint: "item/#{story_id}.json"
          )
        end
  
        private
  
        def client
          @_client ||= Faraday.new(API_ENDPOINT) do |client|
            client.request :url_encoded
            client.adapter Faraday.default_adapter
          end
        end
  
        def request(http_method: :get, endpoint:, params: {})
          response = client.public_send(http_method, endpoint, params)
          JSON.parse(response.body)
        end
      end
    end
  end