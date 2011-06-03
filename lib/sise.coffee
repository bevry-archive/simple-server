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
    app.use express.static cwd
    app.use express.errorHandler {dumpExceptions: true, showStack: true }
	coffee4clients.setup app, publicPath

# Listen
app.listen port
console.log 'Express server listening on port %d', app.address().port