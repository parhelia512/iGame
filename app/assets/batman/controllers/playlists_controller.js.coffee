class IGame.PlaylistsController extends IGame.ApplicationController
  routingKey: 'playlists'

  index: (params) ->
@set('playlists', Rdio.Playlist.get('all'))
  show: (params) ->

  edit: (params) ->

  new: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

