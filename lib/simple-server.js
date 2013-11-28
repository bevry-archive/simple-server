(function(){
	// Requirements
	var http = require('http');
	var connect = require('connect')
	var pathUtil = require('path')

	// Arguments
	var port, publicPath, arg;
	arg = process.argv[2];
	if ( arg ) {
		port = parseInt(arg, 10);
		if ( isNaN(port) ) {
			publicPath = arg;
		}
		else {
			port = port;
		}
	}
	arg = process.argv[3];
	if ( arg ) {
		port = parseInt(arg, 10);
		if ( isNaN(port) ) {
			publicPath = arg;
		}
		else {
			port = port;
		}
	}
	port = port || 3000;
	publicPath = pathUtil.resolve(publicPath || '.')

	// Create Server
	var app = connect()
		.use(connect.favicon())
		.use(connect.directory(publicPath))
		.use(connect.static(publicPath))

	// Listen
	var server = http.createServer(app).listen(port);

	// Log
	var address = server.address()
	var serverHostname = 'localhost';
	if (address.address !== '0.0.0.0')  serverHostname = address.address;
	var serverPort = address.port
	var serverLocation = "http://"+serverHostname+":"+serverPort+"/"
	console.log("Simple-Server listening to "+serverLocation+" with directory "+publicPath)
})();
