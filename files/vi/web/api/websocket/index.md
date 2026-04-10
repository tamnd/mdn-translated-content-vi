---
title: WebSocket
slug: Web/API/WebSocket
page-type: web-api-interface
browser-compat: api.WebSocket
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Đối tượng `WebSocket` cung cấp API để tạo và quản lý một kết nối [WebSocket](/en-US/docs/Web/API/WebSockets_API) tới máy chủ, đồng thời gửi và nhận dữ liệu qua kết nối đó.

Để tạo một `WebSocket`, hãy dùng constructor [`WebSocket()`](/en-US/docs/Web/API/WebSocket/WebSocket).

> [!NOTE]
> API `WebSocket` không có cách nào áp dụng [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure), vì vậy khi thông điệp đến nhanh hơn tốc độ ứng dụng có thể xử lý, ứng dụng sẽ làm đầy bộ nhớ thiết bị bằng cách đệm các thông điệp đó, trở nên không phản hồi do dùng 100% CPU, hoặc cả hai. Nếu bạn cần một lựa chọn tự động hỗ trợ backpressure, hãy xem {{domxref("WebSocketStream")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("WebSocket.WebSocket", "WebSocket()")}}
  - : Trả về một đối tượng `WebSocket` mới được tạo.

## Thuộc tính thể hiện

- {{domxref("WebSocket.binaryType")}}
  - : Kiểu dữ liệu nhị phân được dùng cho kết nối.
- {{domxref("WebSocket.bufferedAmount")}} {{ReadOnlyInline}}
  - : Số byte dữ liệu đang được xếp hàng.
- {{domxref("WebSocket.extensions")}} {{ReadOnlyInline}}
  - : Các tiện ích được máy chủ chọn.
- {{domxref("WebSocket.protocol")}} {{ReadOnlyInline}}
  - : Giao thức phụ được máy chủ chọn.
- {{domxref("WebSocket.readyState")}} {{ReadOnlyInline}}
  - : Trạng thái hiện tại của kết nối.
- {{domxref("WebSocket.url")}} {{ReadOnlyInline}}
  - : URL tuyệt đối của WebSocket.

## Phương thức thể hiện

- {{domxref("WebSocket.close()")}}
  - : Đóng kết nối.
- {{domxref("WebSocket.send()")}}
  - : Xếp hàng dữ liệu để truyền đi.

## Sự kiện

Hãy lắng nghe các sự kiện này bằng `addEventListener()` hoặc bằng cách gán trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này.

- {{domxref("WebSocket/close_event", "close")}}
  - : Được kích hoạt khi kết nối `WebSocket` bị đóng.
    Cũng có sẵn qua thuộc tính `onclose`.
- {{domxref("WebSocket/error_event", "error")}}
  - : Được kích hoạt khi kết nối `WebSocket` bị đóng do lỗi, chẳng hạn khi một số dữ liệu không thể được gửi.
    Cũng có sẵn qua thuộc tính `onerror`.
- {{domxref("WebSocket/message_event", "message")}}
  - : Được kích hoạt khi dữ liệu được nhận qua `WebSocket`.
    Cũng có sẵn qua thuộc tính `onmessage`.
- {{domxref("WebSocket/open_event", "open")}}
  - : Được kích hoạt khi kết nối `WebSocket` được mở.
    Cũng có sẵn qua thuộc tính `onopen`.

## Ví dụ

```js
// Tạo kết nối WebSocket.
const socket = new WebSocket("ws://localhost:8080");

// Kết nối đã mở
socket.addEventListener("open", (event) => {
  socket.send("Hello Server!");
});

// Lắng nghe thông điệp
socket.addEventListener("message", (event) => {
  console.log("Thông điệp từ máy chủ ", event.data);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Viết ứng dụng máy khách WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)
