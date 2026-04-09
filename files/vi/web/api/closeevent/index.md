---
title: CloseEvent
slug: Web/API/CloseEvent
page-type: web-api-interface
browser-compat: api.CloseEvent
---

{{APIRef("Websockets API")}}{{AvailableInWorkers}}

`CloseEvent` được gửi tới client dùng {{Glossary("WebSockets")}} khi kết nối bị đóng. Sự kiện này được chuyển tới trình lắng nghe được chỉ định bởi thuộc tính `onclose` của đối tượng `WebSocket`.

{{InheritanceDiagram}}

## Constructor

- {{domxref("CloseEvent.CloseEvent", "CloseEvent()")}}
  - : Tạo một `CloseEvent` mới.

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính từ đối tượng cha của nó, {{domxref("Event")}}._

- {{domxref("CloseEvent.code")}} {{ReadOnlyInline}}
  - : Trả về một giá trị `unsigned short` chứa mã đóng.
- {{domxref("CloseEvent.reason")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết lý do máy chủ đóng kết nối. Giá trị này phụ thuộc vào máy chủ và giao thức con cụ thể.
- {{domxref("CloseEvent.wasClean")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết kết nối có được đóng một cách sạch sẽ hay không.

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức từ đối tượng cha của nó, {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebSocket")}}
