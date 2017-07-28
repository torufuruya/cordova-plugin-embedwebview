var exec = require('cordova/exec');

exports.open = function(arg0) {
    exec(function(res){}, function(res){}, "EmbedWebview", "open", [arg0]);
};
               
exports.close = function(arg0, success, error) {
    exec(function(res){}, function(res){}, "EmbedWebview", "close", [arg0]);
};