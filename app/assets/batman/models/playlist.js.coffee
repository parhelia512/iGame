class IGame.Playlist extends Batman.Model
  @resourceName: 'playlists'
  @storageKey: 'playlists'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  # @encode 'name'
  @encodeTimestamps()

