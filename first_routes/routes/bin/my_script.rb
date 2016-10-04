require 'addressable/uri'
require 'rest-client'

def index_users
    # url = Addressable::URI.new(
    #   scheme: 'http',
    #   host: 'localhost',
    #   port: 3000,
    #   path: '/users.html'
    # ).to_s

    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users/5.json',
      # query_values: {
      #   'some_category[a_key]' => 'another value',
      #   'some_category[a_second_key]' => 'yet another value',
      #   'some_category[inner_inner_hash][key]' => 'value',
      #   'something_else' => 'aaahhhhh'
      # }
    ).to_s

    puts RestClient.get(url)
end

# index_users


def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s

  puts RestClient.post(url, {user: {name: name  }})
end

create_user('bob', 'bob@gmail.com')
