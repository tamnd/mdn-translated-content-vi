---
title: "WebSocketStream: thuộc tính closed"
short-title: closed
slug: Web/API/WebSocketStream/closed
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.WebSocketStream.closed
---

{{APIRef("WebSockets API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`closed`** của giao diện {{domxref("WebSocketStream")}} trả về một {{jsxref("Promise")}} được thực thi với một đối tượng khi kết nối socket đóng lại. Đối tượng này chứa mã đóng và lý do.

## Giá trị

Một promise, sẽ được thực thi với một đối tượng chứa các thuộc tính sau:

- `closeCode`
  - : Một số biểu thị mã đóng (xem danh sách đầy đủ [`CloseEvent` status codes](/en-US/docs/Web/API/CloseEvent/code#value)).
- `reason`
  - : Một chuỗi biểu thị mô tả dễ đọc về lý do socket connection bị đóng.

Promise sẽ bị reject nếu kết nối WebSocket không đóng sạch sẽ (để đóng sạch, kết nối TCP liên kết phải được đóng _sau_ khi hoàn tất WebSocket closing handshake).

## Ví dụ

```js
const wsURL = "wss://127.0.0.1/";
const wss = new WebSocketStream(wsURL);

wss.closed.then((result) => {
  writeToScreen(
    `DISCONNECTED: code ${result.closeCode}, message "${result.reason}"`,
  );
  console.log("Socket closed", result.closeCode, result.reason);
});
```

Xem [Using WebSocketStream to write a client](/en-US/docs/Web/API/WebSockets_API/Using_WebSocketStream) để biết ví dụ đầy đủ với giải thích chi tiết.

## Thông số kỹ thuật

Hiện chưa thuộc bất kỳ đặc tả nào. Xem https://github.com/whatwg/websockets/pull/48 để theo dõi tiến trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocketStream: tích hợp streams với WebSocket API](https://developer.chrome.com/docs/capabilities/web-apis/websocketstream), developer.chrome.com (2020)
