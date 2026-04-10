---
title: "WebSocket: sự kiện error"
short-title: error
slug: Web/API/WebSocket/error_event
page-type: web-api-event
browser-compat: api.WebSocket.error_event
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Sự kiện `error` được kích hoạt khi một kết nối với `WebSocket` bị đóng do lỗi (ví dụ, một số dữ liệu không thể được gửi).

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
// Tạo kết nối WebSocket
const socket = new WebSocket("ws://localhost:8080");

// Lắng nghe các lỗi có thể xảy ra
socket.addEventListener("error", (event) => {
  console.log("Lỗi WebSocket: ", event);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocket: sự kiện close](/en-US/docs/Web/API/WebSocket/close_event)
- [WebSocket: sự kiện message](/en-US/docs/Web/API/WebSocket/message_event)
- [WebSocket: sự kiện open](/en-US/docs/Web/API/WebSocket/open_event)
- [Viết ứng dụng máy khách WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)
