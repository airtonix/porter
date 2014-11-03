module.exports.routes =
	'GET /':
		view: 'homepage'

	# 'POST /_session':
	# 	controller: 'Proxy.session'

	'GET /-/user/:org_couchdb_user':
		controller: 'user'
		action: 'read'
		name: 'get-user'

	'PUT /-/user/:org_couchdb_user/:_rev?/:revision?':
		controller: 'user'
		action: 'create'

	# Query: npm search
	'GET /-/all':
		controller: 'package'
		action: 'search'

	# Query: npm search term
	'GET /-/all/:anything?':
		controller: 'package'
		action: 'search'

	# Meta: get package.json
	'GET /:package/:version?':
		controller: 'package'
		action: 'meta'

	# Meta: tagging a package
	'PUT /:package/:tag':
		controller: 'package'
		action: 'tag'

	# Meta: adding a version
	'PUT /:package/:version/-tag/:tag':
		controller: 'package'
		action: 'version'

	# Meta: publishing a package
	'PUT /:package/:_rev?/:revision?':
		controller: 'package'
		action: 'publish'

	# Meta: unpublish an entire package
	'DELETE /:package/-rev/*': 
		controller: 'package'
		action: 'unpublish'

	# Binary: get package file
	'GET /:package/-/:filename':
		controller: 'package'
		action: 'file'

	# Binary: removing a tarball
	'DELETE /:package/-/:filename/-rev/:revision':
		controller: 'package'
		action: 'remove_file'

	# Binary: uploading package tarball
	'PUT /:package/-/:filename/*':
		controller: 'package'
		action: 'upload'


