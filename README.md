OmniAuth Rdio
=============

[Rdio OAuth 1.0a][rdio-oauth] Strategy for OmniAuth 1.0.

## Installation

Add to your project Gemfile:

```ruby
gem 'omniauth-rdio'
```

## Usage

Read the [OmniAuth 1.0][omniauth] documentation for detailed instructions.

Pass your [Rdio Application Key and Secret][rdio-register] as arguments when
initializing the provider.

For example, if using as middleware in a Rails app, add the following to an
initializer:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :rdio, ENV['RDIO_APP_KEY'], ENV['RDIO_APP_SECRET']
end
```

## Authentication Hash

Example of the provider's [Auth Hash Schema][hash-schema]
(`request.env['omniauth.auth']`):

```ruby
{
  "provider" => "rdio",
  "uid" => "aaa...",
  "info" => {
    "name" => "Gopal Patel",
    "nickname" => "nixme",
    "first_name" => "Gopal",
    "last_name" => "Patel",
    "image" => "http://cdn3.rd.io/user/no-user-image-square.jpg",
    "urls" => {
      "User" => "http://www.rdio.com/people/nixme/",
      "Collection" => "http://www.rdio.com/people/nixme/collection/",
      "Playlists" => "http://www.rdio.com/people/nixme/playlists/",
      "Following" => "http://www.rdio.com/people/nixme/people/following/",
      "Followers" => "http://www.rdio.com/people/nixme/people/followers/"
    }
  },
  "credentials" => {
    "token" => "123456...",                   # OAuth access token
    "secret" => "abcde..."                    # OAuth secret
  },
  "extra" => {
    "access_token" => <OAuth::AccessToken>,   # OAuth::AccessToken instance for making API requests.
    "raw_info" => {                           # Result of the currentUser Rdio Web Service call.
      "followingUrl" => "/people/nixme/people/following/",    # Includes all optional User fields
      "baseIcon" => "user/no-user-image-square.jpg",          #   except lastSongPlayed and
      "isTrial" => false,                                     #   lastSongPlayTime.
      "artistCount" => 64,
      "heavyRotationKey" => "eee...",
      "networkHeavyRotationKey" => "bbb...",
      "albumCount" => 114,
      "libraryVersion" => 406,
      "trackCount" => 1391,
      "type" => "s",
      "username" => "nixme",
      "collectionUrl" => "/people/nixme/collection/",
      "playlistsUrl" => "/people/nixme/playlists/",
      "key" => "aaa...",
      "collectionKey" => "ccc...",
      "followersUrl" => "/people/nixme/people/followers/",
      "icon" => "http://cdn3.rd.io/user/no-user-image-square.jpg",
      "displayName" => "Gopal Patel",
      "isUnlimited" => true,
      "firstName" => "Gopal",
      "url" => "/people/nixme/",
      "gender" => "m",
      "lastName" => "Patel",
      "isSubscriber" => true
    }
  }
}
```

## Contributing

Patches and bug reports are welcome. Just send a [pull request][pullrequests] or
file an [issue][issues]. [Project changelog][changelog].


[rdio-oauth]:    http://developer.rdio.com/docs/read/rest/oauth
[omniauth]:      https://github.com/intridea/omniauth
[rdio-register]: http://developer.rdio.com/apps/register
[hash-schema]:   https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
[pullrequests]:  https://github.com/nixme/omniauth-rdio/pulls
[issues]:        https://github.com/nixme/omniauth-rdio/issues
[changelog]:     https://github.com/nixme/omniauth-rdio/blob/master/CHANGELOG.md
