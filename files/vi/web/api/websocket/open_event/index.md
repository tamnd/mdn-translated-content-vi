---
title: "WebSocket: sự kiện open"
short-title: open
slug: Web/API/WebSocket/open_event
page-type: web-api-event
browser-compat: api.WebSocket.open_event
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Sự kiện `open` được kích hoạt khi một kết nối với `WebSocket` được mở.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("open", (event) => { })

onopen = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
// Tạo kết nối WebSocket.
const socket = new WebSocket("ws://localhost:8080");

// Kết nối đã mở
socket.addEventListener("open", (event) => {
  socket.send("Hello Server!");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocket: sự kiện close](/en-US/docs/Web/API/WebSocket/close_event)
- [WebSocket: sự kiện error](/en-US/docs/Web/API/WebSocket/error_event)
- [WebSocket: sự kiện message](/en-US/docs/Web/API/WebSocket/message_event)
- [Viết ứng dụng máy khách WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)
