const fs = require("fs");
const path = require("path");

const regStyle = /<style>[\s\S]*<\/style>/;
const regScript = /<script>[\s\S]*<\/script>/;

fs.readFile(path.join(__dirname, "./3.html"), "utf8", function (err, dataStr) {
  if (err) {
    return console.log("读取文件失败" + err.message);
  }
  resolveCss(dataStr);
  resolveJS(dataStr);
  resolveHTML(dataStr);
});

function resolveCss(htmlStr) {
  const r1 = regStyle.exec(htmlStr);
  const newCss = r1[0].replace("<style>", "").replace("</style>", "");
  fs.writeFile(
    path.join(__dirname, "./newhtml/index.css"),
    newCss,
    function (err) {
      if (err) {
        return console.log("写入css失败" + err.message);
      }
      console.log("写入css成功");
    },
  );
}
function resolveJS(htmlStr) {
  const r2 = regScript.exec(htmlStr);
  const newJS = r2[0].replace("<script>", "").replace("</script>", "");
  fs.writeFile(
    path.join(__dirname, "./newhtml/index.js"),
    newJS,
    function (err) {
      if (err) {
        return console.log("写入js失败" + err.message);
      }
      console.log("写入js成功");
    },
  );
}

function resolveHTML(htmlStr) {
  const newHtml = htmlStr
    .replace(regStyle, "<link res='stylesheet' href='./index.css' />")
    .replace(regScript, '<script src="./index.js"></script>');
  fs.writeFile(
    path.join(__dirname, "./newhtml/index.html"),
    newHtml,
    function (err) {
      if (err) {
        return console.log("写入html文件失败" + err.message);
      }
      console.log("写入html文件成功");
    },
  );
}
