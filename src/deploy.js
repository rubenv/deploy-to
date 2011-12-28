var exec = require('child_process').exec;
var async = require('async');

function get_ref(name, cb) {
    exec('/usr/bin/git show-ref -s ' + name, function (error, stdout, stderr) {
        cb(error, stdout.trim());
    });
}

if (process.argv.length <= 2) {
    console.log('Usage: deploy-to <branch>');
    process.exit();
}

var target = process.argv[2];

async.parallel({
    master: function (cb) { get_ref('master', cb); },
    head: function (cb) { get_ref('HEAD', cb); },
    target: function (cb) { get_ref(target, cb); }
}, function (err, data) {
    console.log(data);
});
