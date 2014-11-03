_ = require 'lodash'

module.exports =

	create: (request, response) ->
		console.log _.keys(@), 'user.create', request.url
		response.status 403
		response.send {error:'Not Implemented'}

	read: (request, response) ->
		console.log @, 'user.read', request.url
		response.status 403
		response.send {error:'Not Implemented'}
