const fs = require("fs");
// TODO: 读取文件
fs.readFile("./text", 'utf8', function(err, dataStr) {
	if (err) {
		return console.log("读取文件失败" + err.message)
	}
	console.log("读取文件成功 " + dataStr)
})
// TODO: 写入文件
fs.writeFile("./text1", "hello world", "utf8", function(err) {
	if (err) {
		return console.log("写入文件失败" + err.message)
	}
	console.log("写入文件成功 ")
})
