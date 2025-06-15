const fs = require("fs");
const path = require("path");
console.log(__dirname);
fs.readFile(
	path.join(__dirname, "./成绩.text"),
	"utf8",
	function (err, dataStr) {
		if (err) {
			return console.log("读取失败" + err.message);
		}
		console.log("读取成功" + dataStr);
	}
);

const fpath = "/a/b/c/index.html";
const fullname = path.basename(fpath);
console.log(fullname);
const fullnames = path.basename(fpath, ".html");
console.log(fullnames);
const pathname = path.extname(fpath);
console.log(pathname);
