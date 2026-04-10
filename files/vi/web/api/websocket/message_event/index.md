---
title: "WebSocket: sự kiện message"
short-title: message
slug: Web/API/WebSocket/message_event
page-type: web-api-event
browser-compat: api.WebSocket.message_event
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Sự kiện `message` được kích hoạt khi dữ liệu được nhận qua `WebSocket`.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("MessageEvent.data", "data")}} {{ReadOnlyInline}}
  - : Dữ liệu do bộ phát thông điệp gửi. Kiểu của thuộc tính này phụ thuộc vào kiểu thông điệp WebSocket và giá trị của {{domxref("WebSocket.binaryType")}}.
    - Nếu kiểu thông điệp là "text", trường này là một chuỗi.
    - Nếu kiểu thông điệp là "binary", kiểu của thuộc tính này có thể được suy ra từ `binaryType` của socket này:
      - {{jsxref("ArrayBuffer")}} nếu `binaryType` là `"arraybuffer"`,
      - {{domxref("Blob")}} nếu `binaryType` là `"blob"`. Kiểu này không có kiểu phương tiện đi kèm ({{domxref("Blob.type")}} là `""`).
- {{domxref("MessageEvent.origin", "origin")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị origin của bộ phát thông điệp.

Các thuộc tính khác từ giao diện {{domxref("MessageEvent")}} vẫn có mặt, nhưng không liên quan tới API WebSocket và được giữ ở giá trị mặc định:

- {{domxref("MessageEvent.lastEventId", "lastEventId")}} {{ReadOnlyInline}}
- {{domxref("MessageEvent.source", "source")}} {{ReadOnlyInline}}
- {{domxref("MessageEvent.ports", "ports")}} {{ReadOnlyInline}}

## Ví dụ

```js
// Tạo kết nối WebSocket.
const socket = new WebSocket("ws://localhost:8080");

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

- [WebSocket: sự kiện close](/en-US/docs/Web/API/WebSocket/close_event)
- [WebSocket: sự kiện error](/en-US/docs/Web/API/WebSocket/error_event)
- [WebSocket: sự kiện open](/en-US/docs/Web/API/WebSocket/open_event)
- [Viết ứng dụng máy khách WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)
