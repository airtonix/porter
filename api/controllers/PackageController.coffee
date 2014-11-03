https = require 'https'
requests = require 'request'
JSONStream = require 'JSONStream'

Package = require '../models/Package'

module.exports =
	###*
	 * Search Endpoint
	 * handles:
	 *  - npm search <query>
	 *  - npm find <query>
	 * example url:
	 *  /-/all/since?stale=update_after&startkey=1414575483000
	 * @param  {[type]} request
	 * @param  {[type]} response
	 * @return {[type]}
	###
	search: (request, response) ->
		console.log 'search', request.url
		storage.search 
		requests url: 'https://registry.npmjs.org/-/all'
			.pipe JSONStream.parse '*'
			.on 'data', (data) ->
				response.send data

	###*
	 * Package meta endpoint
	 * handles:
	 *  - npm bug <package>
	 *  - npm owner ls <package>
	 *  - npm deprecate <package>@<semver> <message>
	 *  - npm docs <package>
	 *  - npm home <package>
	 *  - npm info <package>
	 *  - npm install <package>
	 *  - npm issues <package>
	 *  - npm ln/link [package]
	 *  - npm outdated <package>
	 *  - npm show <package>
	 *  - npm submodule <package>
	 *  - npm unpublish <package>@<version>
	 *  - npm update
	 * @param  {[type]} request
	 * @param  {[type]} response
	 * @return {[type]} streaming json dump
	###
	meta: (request, response) ->
		console.log 'meta', request.url
		response.send {error:'Not Implemented'}

	tag: (request, response) ->
		console.log 'tag', request.url
		response.send {error:'Not Implemented'}

	version: (request, response) ->
		console.log 'version', request.url
		response.send {error:'Not Implemented'}

	publish: (request, response) ->
		console.log 'publish', request.url
		response.send {error:'Not Implemented'}

	###*
	 * [unpublish description]
	 * used by:
	 *  - npm unpublish <package>@<version>
	 * @param  {[type]} request
	 * @param  {[type]} response
	 * @return {[type]}
	###
	unpublish: (request, response) ->
		console.log 'unpublish', request.url
		response.send {error:'Not Implemented'}

	file: (request, response) ->
		console.log 'file', request.url
		response.send {error:'Not Implemented'}

	remove_file: (request, response) ->
		console.log 'remove_file', request.url
		response.send {error:'Not Implemented'}

	upload: (request, response) ->
		console.log 'upload', request.url

		name = request.params.package
		filename = request.params.filename

		# stream = storage.add_tarball(name, request.params.filename)

		request.file 'package'
			.upload (err, files) ->
				if err
					return res.serverError err

				response.status 201
				return response.json
					message: files.length + ' file(s) uploaded successfully!',
					files: files
