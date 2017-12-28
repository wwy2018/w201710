const http = require("http");
const log = require("./log");
const reverseProxy = require("./proxy");

// 创建反向代理服务器
function startProxyServer(port) {
  return new Promise((resolve, reject) => {
    const server = http.createServer(
      reverseProxy({
        servers: ["127.0.0.1:3001", "127.0.0.1:3002", "127.0.0.1:3003"]
      })
    );
    server.listen(port, () => {
      log("反向代理服务器已启动: %s", port);
      resolve(server);
    });
    server.on("error", reject);
  });
}

// 创建演示服务器
function startExampleServer(port) {
  return new Promise((resolve, reject) => {
    const server = http.createServer(function(req, res) {
      const chunks = [];
      req.on("data", chunk => chunks.push(chunk));
      req.on("end", () => {
        const buf = Buffer.concat(chunks);
        res.end(`${port}: ${req.method} ${req.url} ${buf.toString()}`.trim());
      });
    });
    server.listen(port, () => {
      log("服务器已启动: %s", port);
      resolve(server);
    });
    server.on("error", reject);
  });
}

(async function() {
  await startExampleServer(3001);
  await startExampleServer(3002);
  await startExampleServer(3003);
  await startProxyServer(3000);
})();