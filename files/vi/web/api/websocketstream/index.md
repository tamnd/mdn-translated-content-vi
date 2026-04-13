---
title: WebSocketStream
slug: Web/API/WebSocketStream
page-type: web-api-interface
status:
  - experimental
browser-compat: api.WebSocketStream
---

{{APIRef("WebSockets API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Giao diện **`WebSocketStream`** của {{domxref("WebSockets API", "WebSockets API", "", "nocode")}} là một API dựa trên promise để kết nối với máy chủ WebSocket. Nó dùng [streams](/en-US/docs/Web/API/Streams_API) để gửi và nhận dữ liệu trên kết nối, nên có thể tự động tận dụng cơ chế [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) của stream, điều tiết tốc độ đọc hoặc ghi để tránh nghẽn trong ứng dụng.

{{InheritanceDiagram}}

## Constructor

- {{domxref("WebSocketStream.WebSocketStream", "WebSocketStream()")}} {{experimental_inline}}
  - : Tạo một thể hiện đối tượng `WebSocketStream` mới.

## Thuộc tính thể hiện

- {{domxref("WebSocketStream.url", "url")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về URL của máy chủ WebSocket mà thể hiện `WebSocketStream` được tạo với.
- {{domxref("WebSocketStream.closed", "closed")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một {{jsxref("Promise")}} sẽ được thực thi với một đối tượng khi kết nối socket đóng lại. Đối tượng này chứa mã đóng và lý do do máy chủ gửi.
- {{domxref("WebSocketStream.opened", "opened")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một {{jsxref("Promise")}} sẽ được thực thi với một đối tượng khi kết nối socket mở thành công. Trong số các tính năng khác, đối tượng này chứa một thể hiện {{domxref("ReadableStream")}} và {{domxref("WritableStream")}} để nhận và gửi dữ liệu trên kết nối.

## Phương thức thể hiện

- {{domxref("WebSocketStream.close", "close()")}} {{experimental_inline}}
  - : Đóng kết nối WebSocket.

## Ví dụ

```js
const output = document.querySelector("#output");

function writeToScreen(message) {
  const pElem = document.createElement("p");
  pElem.textContent = message;
  output.appendChild(pElem);
}

if (!("WebSocketStream" in self)) {
  writeToScreen("Trình duyệt của bạn không hỗ trợ WebSocketStream");
} else {
  const wsURL = "ws://127.0.0.1/";
  const wss = new WebSocketStream(wsURL);

  console.log(wss.url);

  async function start() {
    const { readable, writable, extensions, protocol } = await wss.opened;
    writeToScreen("CONNECTED");
    closeBtn.disabled = false;
    const reader = readable.getReader();
    const writer = writable.getWriter();

    writer.write("ping");
    writeToScreen("SENT: ping");

    while (true) {
      const { value, done } = await reader.read();
      writeToScreen(`RECEIVED: ${value}`);
      if (done) {
        break;
      }

      setTimeout(() => {
        writer.write("ping");
        writeToScreen("SENT: ping");
      }, 5000);
    }
  }

  start();
}
```

Xem [Using WebSocketStream to write a client](/en-US/docs/Web/API/WebSockets_API/Using_WebSocketStream) để xem ví dụ đầy đủ kèm giải thích chi tiết.

## Thông số kỹ thuật

Hiện chưa thuộc bất kỳ đặc tả nào. Xem https://github.com/whatwg/websockets/pull/48 để theo dõi tiến trình chuẩn hóa.

[Thiết kế API WebSocketStream](https://docs.google.com/document/d/1La1ehXw76HP6n1uUeks-WJGFgAnpX2tCjKts7QFJ57Y/edit?pli=1&tab=t.0).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocketStream: tích hợp streams với WebSocket API](https://developer.chrome.com/docs/capabilities/web-apis/websocketstream), developer.chrome.com (2020)
