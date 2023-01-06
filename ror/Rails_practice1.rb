
rails new test_app

rails g controller controller_names(任意命名) [action1 action2(ruby method)]

rails g scaffold car make color year:integer


erb file.
ruby code tag

1.

<% ...RUBY CODE...%>

2.

<% ...%>




rubygem



gem install rake

gem list httparty

gem install httparty





RESTful Web Services:

implemented using HTTP
1. have a base URI
2. support data exchange format: XML JSON
3. support set of HTTP operations:
GET PSOT

HTTParty Gem
: client
Automatic parsing of JSON, XML into Ruby hashes



include HTTParty

base_uri
default_params
format