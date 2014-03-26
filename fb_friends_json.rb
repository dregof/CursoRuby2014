#!/usr/bin/env ruby
# gem install koala --no-document
require 'koala'
require 'json'

# https://developers.facebook.com/tools/explorer
oauth_access_token = 'xxxxxxxxxxxxxxxx'

graph = Koala::Facebook::API.new(oauth_access_token)
fields = 'first_name,last_name,bio,name,birthday,gender,hometown,relationship_status,username'

friends = []
page = graph.get_connections("me", "friends/?fields=#{fields}")
begin
  friends += page
end while page = page.next_page

File.write 'friends.json', friends.to_json
