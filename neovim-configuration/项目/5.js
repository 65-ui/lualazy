const fs = require("fs");
fs.readFile("./成绩.text", "utf8", function (err, dateStr) {
	if (err) {
		return console.log("读取文件失败" + err.message);
	}
	const arrOud = dateStr.split(" ");
	const arrnew = [];
	arrOud.forEach((item) => {
		arrnew.push(item.replace("==", ": "));
	});
	const newStr = arrnew.join("\r\t");
	fs.writeFile("./成绩4.text", newStr, "utf-8", function (err) {
		if (err) {
			return console.log("写入文件失败" + err.message);
		}
		console.log("写入文件成功");
	});
});
alert();
