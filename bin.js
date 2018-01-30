#!/usr/bin/env node
var dir, port

process.argv.slice(2).forEach(function (arg) {
	var num = Number(arg)
	if (isNaN(num)) {
		dir = arg
	}
	else {
		port = num
	}
})


require('./')(dir, port)