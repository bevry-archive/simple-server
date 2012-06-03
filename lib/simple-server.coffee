# Requirements
express = require('express')
path = require('path')
jadeStatic = require('jade-static')

# Variables
publicPath = path.resolve(process.argv[2]||'.')
port = process.argv[3]||3000

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
	server.use jadeStatic publicPath
	server.use express.directory publicPath

# Listen
server.listen port

# Log
address = server.address()
serverHostname = if address.address is '0.0.0.0' then 'localhost' else address.address
serverPort = address.port
serverLocation = "http://#{serverHostname}:#{serverPort}/"
console.log "Simple-Server listening to #{serverLocation} with directory #{publicPath}"