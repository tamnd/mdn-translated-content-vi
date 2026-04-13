---
title: "WebSocketStream: thuộc tính opened"
short-title: opened
slug: Web/API/WebSocketStream/opened
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.WebSocketStream.opened
---

{{APIRef("WebSockets API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`opened`** của giao diện {{domxref("WebSocketStream")}} trả về một {{jsxref("Promise")}} được thực thi với một đối tượng khi kết nối socket mở thành công. Trong số các tính năng khác, đối tượng này chứa một thể hiện {{domxref("ReadableStream")}} và {{domxref("WritableStream")}} để nhận và gửi dữ liệu trên kết nối.

## Giá trị

Một promise, sẽ được thực thi với một đối tượng chứa các thuộc tính sau:

- `extensions`
  - : Một chuỗi biểu thị các extension đã áp dụng cho `WebSocketStream`. Hiện tại các extension này chưa được định nghĩa, nhưng có thể sẽ có trong tương lai. Hiện trả về một chuỗi rỗng.
- `protocol`
  - : Một chuỗi biểu thị sub-protocol được dùng để mở kết nối WebSocket hiện tại (được chọn từ các tùy chọn được chỉ định trong tùy chọn [`protocols`](/en-US/docs/Web/API/WebSocketStream/WebSocketStream#protocols) của constructor `WebSocketStream()`). Trả về một chuỗi rỗng nếu không dùng sub-protocol nào để mở kết nối (tức là không có tùy chọn sub-protocol nào được đưa vào lời gọi constructor).
- `readable`
  - : Một thể hiện {{domxref("ReadableStream")}}. Gọi {{domxref("ReadableStream.getReader()")}} trên nó để lấy một thể hiện {{domxref("ReadableStreamDefaultReader")}} có thể dùng để đọc dữ liệu WebSocket đến.
- `writable`
  - : Một thể hiện {{domxref("WritableStream")}}. Gọi {{domxref("WritableStream.getWriter()")}} trên nó để lấy một thể hiện {{domxref("WritableStreamDefaultWriter")}} có thể dùng để ghi dữ liệu vào kết nối WebSocket.

Promise sẽ bị reject nếu kết nối WebSocket thất bại.

## Ví dụ

```js
const wsURL = "wss://127.0.0.1/";
const wss = new WebSocketStream(wsURL);

async function start() {
  const { readable, writable, extensions, protocol } = await wss.opened;

  const reader = readable.getReader();
  const writer = writable.getWriter();

  writer.write("ping");

  while (true) {
    const { value, done } = await reader.read();
    if (done) {
      break;
    }

    setTimeout(() => {
      writer.write("ping");
    }, 5000);
  }
}
```

Xem [Using WebSocketStream to write a client](/en-US/docs/Web/API/WebSockets_API/Using_WebSocketStream) để biết ví dụ đầy đủ với giải thích chi tiết.

## Thông số kỹ thuật

Hiện chưa thuộc bất kỳ đặc tả nào. Xem https://github.com/whatwg/websockets/pull/48 để theo dõi tiến trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocketStream: tích hợp streams với WebSocket API](https://developer.chrome.com/docs/capabilities/web-apis/websocketstream), developer.chrome.com (2020)
