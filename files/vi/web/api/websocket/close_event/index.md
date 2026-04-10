---
title: "WebSocket: sự kiện close"
short-title: close
slug: Web/API/WebSocket/close_event
page-type: web-api-event
browser-compat: api.WebSocket.close_event
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Sự kiện `close` được kích hoạt khi một kết nối với `WebSocket` bị đóng.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("close", (event) => { })

onclose = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("CloseEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("CloseEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("CloseEvent.code", "code")}} {{ReadOnlyInline}}
  - : Trả về một `unsigned short` chứa mã đóng được máy chủ gửi.
- {{domxref("CloseEvent.reason", "reason")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết lý do máy chủ đóng kết nối. Giá trị này đặc thù cho từng máy chủ và giao thức phụ.
- {{domxref("CloseEvent.wasClean", "wasClean")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết kết nối có được đóng một cách sạch sẽ hay không.

## Ví dụ

Bạn có thể muốn biết khi nào kết nối đã được đóng để cập nhật giao diện người dùng hoặc lưu dữ liệu về kết nối đã đóng. Giả sử bạn có một biến tên `exampleSocket` tham chiếu tới một `WebSocket` đã mở, bộ xử lý này sẽ xử lý trường hợp socket đã bị đóng.

```js
exampleSocket.addEventListener("close", (event) => {
  console.log("Kết nối đã được đóng thành công.");
});
```

Bạn có thể thực hiện cùng hành động đó bằng thuộc tính trình xử lý sự kiện như sau:

```js
exampleSocket.onclose = (event) => {
  console.log("Kết nối đã được đóng thành công.");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebSocket: sự kiện error](/en-US/docs/Web/API/WebSocket/error_event)
- [WebSocket: sự kiện message](/en-US/docs/Web/API/WebSocket/message_event)
- [WebSocket: sự kiện open](/en-US/docs/Web/API/WebSocket/open_event)
- [Viết ứng dụng máy khách WebSocket](/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)
