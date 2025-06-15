// 导入hhttp模块
const http = require("http");
// 创建web服务器实力
const server = http.createServer();
// 为server绑定request事例
server.on("request", (req, res) => {
	// const str = `您请求的 url 地址 ${req.url},您请求的 method 类型是 ${req.method}`;
	const url = req.url;
	let content = "<h1>404 NOT found!</h1>";
	if (url === "/" || url === "/index.html") {
		content = "<h1>首页</h1>";
	} else if (url === "/above.html") {
		content = "<h1>关于页面</h1>";
	}
	res.setHeader("Content-Type", 'text/html; charset="utf-8');
	res.end(str);
});
// 启动服务器

server.listen(8080, () => {
	console.log("正在运行 http:127.0.0.1:8080");
});
