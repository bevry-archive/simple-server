# Requirements
express = require 'express'
coffee4clients = require 'coffee4clients'
cwd = process.cwd()
publicPath = process.argv[2]||cwd
port = process.argv[3]||3000

# Determine
if publicPath.length is 0 or publicPath[0] is '.'
	publicPath = cwd + publicPath

# Create Server
app = express.createServer()

# Configure
app.configure ->
	# Standard
	app.use express.errorHandler()
	app.use express.bodyParser()
	app.use express.methodOverride()

	# Routing
	app.use app.router
	app.use express.static publicPath
	coffee4clients.setup app, publicPath

# Listen
app.listen port
console.log 'Express server listening on port %d', app.address().port