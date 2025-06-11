FROM node:18-alpine

WORKDIR /app

# 간단한 Node.js 서버 생성
RUN echo 'const net = require("net"); \
const port = process.env.PORT || 7911; \
const server = net.createServer((socket) => { \
  console.log("Client connected"); \
  socket.on("data", (data) => { \
    console.log("Received:", data.toString()); \
    socket.write("Hello from EDOPro server"); \
  }); \
  socket.on("end", () => { \
    console.log("Client disconnected"); \
  }); \
}); \
server.listen(port, "0.0.0.0", () => { \
  console.log(`EDOPro server listening on port ${port}`); \
});' > server.js

EXPOSE $PORT

CMD ["node", "server.js"]