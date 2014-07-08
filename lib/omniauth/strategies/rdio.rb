require 'omniauth-oauth'
require 'multi_json'

class OmniAuth::Strategies::Rdio < OmniAuth::Strategies::OAuth
  option :name, 'rdio'
  option :client_options, {
    :site          => 'http://api.rdio.com',
    :authorize_url => 'https://www.rdio.com/oauth/authorize'
  }

  uid { raw_info['key'] }

  BASE_URL = 'http://www.rdio.com'

  info do
    {
      :name       => "#{raw_info['firstName']} #{raw_info['lastName']}".strip,
      :nickname   => raw_info['username'],
      :first_name => raw_info['firstName'],
      :last_name  => raw_info['lastName'],
      :image      => raw_info['icon'],
      :urls => {
        'User'       => BASE_URL + raw_info['url'],
        'Collection' => BASE_URL + raw_info['collectionUrl'],
        'Playlists'  => BASE_URL + raw_info['playlistsUrl'],
        'Following'  => BASE_URL + raw_info['followingUrl'],
        'Followers'  => BASE_URL + raw_info['followersUrl']
      }
    }
  end

  extra do
    { 'raw_info' => raw_info }
  end


  # All optional User fields except lastSongPlayed and lastSongPlayTime.
  # See http://developer.rdio.com/docs/read/rest/types#User
  EXTRA_USER_FIELDS = 'followingUrl,isTrial,artistCount,heavyRotationKey,networkHeavyRotationKey,albumCount,trackCount,username,collectionUrl,playlistsUrl,collectionKey,followersUrl,displayName,isUnlimited,isSubscriber,email,location,gender'

  # Rdio User object from the currentUser call
  # See http://developer.rdio.com/docs/read/rest/Methods#currentUser
  def raw_info
    @raw_info ||=
      begin
        json = access_token.post('http://api.rdio.com/1/',
                                 :method => 'currentUser',
                                 :extras => EXTRA_USER_FIELDS).body
        MultiJson.decode(json)['result']
      end
  rescue ::Errno::ETIMEDOUT
    raise ::Timeout::Error
  end
end
