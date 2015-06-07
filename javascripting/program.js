// var fs = require('fs');

// var buf = fs.readFileSync(process.argv[2]);
// var str = buf.toString();
// var str_arr = str.split('\n');
// console.log(str_arr.length - 1);

//===================================================================================================

// var fs = require('fs');

// function count_line(buf) {
//    return buf.toString().split('\n').length - 1;
// }

// function finishedReading(error, fileData) {
//     if (error) return console.error(error);
//     else console.log(count_line(fileData));
// }


// fs.readFile(process.argv[2], finishedReading);

//===================================================================================================

// var fs = require('fs')
// var path = require('path')


// fs.readdir(process.argv[2], function(err, list) {
//     list.forEach(function (file) {
//        if (path.extname(file) === '.' + process.argv[3])
//             console.log(file);
//     })
// });

//===================================================================================================

var mymodule = require('./mymodule.js')
console.log(mymodule(1,2,3));
// console.log(mymodule.export(1,2,3));
