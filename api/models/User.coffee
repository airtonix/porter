module.exports =
	attributes:
		username: 'string'
		password: 'string'
		email: 'string'
		group:
			collection: 'group'
			via: 'members'