---
title: Viết máy chủ WebSocket bằng JavaScript (Deno)
slug: Web/API/WebSockets_API/Writing_a_WebSocket_server_in_JavaScript_Deno
page-type: guide
---

{{DefaultAPISidebar("WebSockets API")}}

Ví dụ này cho bạn thấy cách tạo một máy chủ API WebSocket bằng Deno, kèm theo một trang web đi cùng.

Deno là một runtime JavaScript hỗ trợ biên dịch và lưu đệm TypeScript ngay khi chạy. Deno có sẵn formatter, linter, bộ chạy kiểm thử và nhiều thứ khác, đồng thời cũng triển khai nhiều API web. Bằng cách tuân thủ các tiêu chuẩn web, tất cả API đặc thù của Deno đều được triển khai trong namespace `Deno`.

[Trang web Deno](https://deno.com/) cung cấp hướng dẫn cài đặt Deno.

Phiên bản Deno tại thời điểm viết bài: `2.6`.

## Mã nguồn

Mã nguồn sẽ nằm trong hai tệp, một cho máy chủ và một cho máy khách.

### Máy chủ

Tạo một tệp `main.js`. Tệp này sẽ chứa mã cho một máy chủ HTTP đơn giản, đồng thời phục vụ HTML của máy khách.

```js
Deno.serve({
  port: 8080,
  async handler(request) {
    if (request.headers.get("upgrade") !== "websocket") {
      // If the request is a normal HTTP request,
      // we serve the client HTML file.
      const file = await Deno.open("./index.html", { read: true });
      return new Response(file.readable);
    }
    // If the request is a websocket upgrade,
    // we need to use the Deno.upgradeWebSocket helper
    const { socket, response } = Deno.upgradeWebSocket(request);

    socket.onopen = () => {
      console.log("CONNECTED");
    };
    socket.onmessage = (event) => {
      console.log(`RECEIVED: ${event.data}`);
      socket.send("pong");
    };
    socket.onclose = () => console.log("DISCONNECTED");
    socket.onerror = (error) => console.error("ERROR:", error);

    return response;
  },
});
```

`Deno.upgradeWebSocket()` nâng cấp kết nối thành một kết nối WebSocket, được giải thích kỹ hơn trong [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism).

### Máy khách

Tạo một tệp `index.html`. Tệp này sẽ gọi một script ping máy chủ cứ 5 giây một lần sau khi kết nối được thiết lập. Nó cũng nên chứa đánh dấu sau:

```html
<h2>WebSocket Test</h2>
<p>Sends a ping every five seconds</p>
<div id="output"></div>
```

```js
const wsUri = "ws://127.0.0.1:8080/";
const output = document.querySelector("#output");
const websocket = new WebSocket(wsUri);
let pingInterval;

function writeToScreen(message) {
  output.insertAdjacentHTML("afterbegin", `<p>${message}</p>`);
}

function sendMessage(message) {
  writeToScreen(`SENT: ${message}`);
  websocket.send(message);
}

websocket.onopen = (e) => {
  writeToScreen("CONNECTED");
  sendMessage("ping");
  pingInterval = setInterval(() => {
    sendMessage("ping");
  }, 5000);
};

websocket.onclose = (e) => {
  writeToScreen("DISCONNECTED");
  clearInterval(pingInterval);
};

websocket.onmessage = (e) => {
  writeToScreen(`RECEIVED: ${e.data}`);
};

websocket.onerror = (e) => {
  writeToScreen(`ERROR: ${e.data}`);
};
```

## Chạy mã

Với hai tệp này, hãy chạy ứng dụng bằng Deno.

```sh
deno run --allow-net=0.0.0.0:8080 --allow-read=./index.html main.js
```

Deno yêu cầu chúng ta cấp quyền rõ ràng cho những gì có thể truy cập trên máy chủ.

- `--allow-net=0.0.0.0:8080` cho phép ứng dụng gắn vào localhost trên cổng 8080
- `--allow-read=./index.html` cho phép truy cập vào tệp HTML của máy khách

## Xem thêm

- [Viết máy chủ WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_servers)
