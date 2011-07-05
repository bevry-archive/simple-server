# Requirements
express = require 'express'
coffee4clients = require 'coffee4clients'
less4clients = require 'less4clients'
cwd = process.cwd()
publicPath = process.argv[2]||cwd
port = process.argv[3]||3000

# Determine
if publicPath.length is 0 or publicPath[0] is '.'
	publicPath = cwd + publicPath

# Create Server
server = express.createServer()

# Configure
server.configure ->
	# Standard
	server.use express.errorHandler()
	server.use express.bodyParser()
	server.use express.methodOverride()

	# Routing
	server.use server.router
	server.use express.static publicPath
	server.use express.directory publicPath

	# Coffee4Clients
	coffee4clients.createInstance {
		server: server
		publicPath: publicPath
	}

	# Less4Clients
	less4clients.createInstance {
		server: server
		publicPath: publicPath
	}

# Listen
server.listen port
console.log 'Express server listening on port %d', server.address().port