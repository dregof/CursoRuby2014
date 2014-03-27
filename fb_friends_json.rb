#!/usr/bin/env ruby
# gem install koala --no-document
require 'koala'
require 'json'

# https://developers.facebook.com/tools/explorer
oauth_access_token = '8980cef3c7f63cf49bc63227af6946d3'

graph = Koala::Facebook::API.new(oauth_access_token)
fields = 'first_name,last_name,bio,name,birthday,gender,hometown,relationship_status,username'

friends = []
page = graph.get_connections("me", "friends/?fields=#{fields}")
begin
  friends += page
end while page = page.next_page

File.write 'friends.json', friends.to_json
