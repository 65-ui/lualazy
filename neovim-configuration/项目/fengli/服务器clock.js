const http = require("http");
const fs = require("fs");
const path = require("path");

const server = http.createServer();
server.on("request", (req, res) => {
  const url = req.url;
  // const fpath = path.join(__dirname, url);
  let fpath = "";
  if (url === "/") {
    fpath = path.join(__dirname, "./newhtml/index.html");
  } else {
    fpath = path.join(__dirname, "/newhtml", url);
  }
  fs.readFile(fpath, "utf8", (err, dataStr) => {
    if (err) {
      return res.end("404 NOTE found!");
    }
    res.end(dataStr);
  });
});
server.listen(8080, () => {
  console.log("server running http:127.0.0.1:8080");
});
