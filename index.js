var serve = require('serve')
var path = require('path')
module.exports = function (dir, port) {
	serve(
		path.resolve(process.cwd(), dir || '.'),
		{
			port: port || 3000,
			ignore: ['node_modules']
		}
	)
}