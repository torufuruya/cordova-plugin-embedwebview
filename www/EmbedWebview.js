var exec = require('cordova/exec');

exports.open = function(arg0) {
    exec(function(res){}, function(res){}, "EmbedWebview", "open", [arg0]);
};
               
exports.close = function() {
    exec(function(res){}, function(res){}, "EmbedWebview", "close", ['']);
};