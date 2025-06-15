const fs = require("fs")
fs.readFile("./成绩.text", "utf8", function(err, dataStr) {
	if (err) {
		return console.log("读取文件失败" + err.message)
	}
	// console.log("读取文件成功" + dataStr)
	const arrold = dataStr.split(" ")
	const arrnew = []
	arrold.forEach(item => {
		arrnew.push(item.replace("=", ": "))
	})
	const newStr = arrnew.join("\r\n")
	fs.writeFile("./成绩3.text", newStr, "utf8", function(err) {
		if (err) {
			return console.log("写入文件失败" + err.message)
		}
		console.log("成绩写入成功")
	})
})
