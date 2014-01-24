class IGame.MainController extends IGame.ApplicationController
  routingKey: 'main'

  index: (params) ->
    @set 'firstName', 'Nango'
    @set 'lastName', 'Wayne'

  @accessor 'fullName', ->
    "#{@get('firstName')} #{@get('lastName')}"
