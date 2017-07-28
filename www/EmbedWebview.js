var exec = require('cordova/exec');

exports.open = function(arg0) {
    exec(function(res){}, function(res){}, "EmbedWebview", "open", [arg0]);
};
               
exports.close = function() {
    exec(function(res){}, function(res){}, "EmbedWebview", "close", ['']);
};

exports.open_a = function(arg0) {
    exec(function(res){}, function(res){}, "EmbedWebview", "open_a", [arg0]);
};
               
exports.close_a = function() {
    exec(function(res){}, function(res){}, "EmbedWebview", "close_a", ['']);
};