var exec = require('cordova/exec');

exports.open = function(arg0, success, error) {
    exec(success, error, "EmbedWebview", "open", [arg0]);
};
               
exports.close = function(arg0, success, error) {
    exec(success, error, "EmbedWebview", "close", [arg0]);
};