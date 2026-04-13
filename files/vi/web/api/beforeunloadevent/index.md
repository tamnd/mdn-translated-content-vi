---
title: BeforeUnloadEvent
slug: Web/API/BeforeUnloadEvent
page-type: web-api-interface
browser-compat: api.BeforeUnloadEvent
---

{{APIRef("HTML DOM")}}

Giao diện **`BeforeUnloadEvent`** biểu diễn đối tượng sự kiện cho sự kiện {{domxref("Window/beforeunload_event", "beforeunload")}}, được kích hoạt khi cửa sổ hiện tại, tài liệu chứa bên trong và các tài nguyên liên quan sắp bị dỡ tải.

Hãy xem trang tham chiếu của sự kiện {{domxref("Window/beforeunload_event", "beforeunload")}} để biết hướng dẫn chi tiết về cách sử dụng sự kiện này.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("Event")}}._

- {{domxref("BeforeUnloadEvent.returnValue", "returnValue")}} {{Deprecated_Inline}}
  - : Khi được đặt thành một giá trị [truthy](/en-US/docs/Glossary/Truthy), thuộc tính này sẽ kích hoạt hộp thoại xác nhận do trình duyệt kiểm soát để hỏi người dùng có muốn rời khỏi trang hay không khi họ cố đóng hoặc tải lại trang. Đây là một tính năng cũ, và cách làm được khuyến nghị là kích hoạt hộp thoại bằng cách gọi `event.preventDefault()`, đồng thời cũng đặt `returnValue` để hỗ trợ các trường hợp cũ.

## Phương thức thể hiện

_Kế thừa các phương thức từ giao diện cha, {{DOMxRef("Event")}}._

## Tiêu chuẩn kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- sự kiện {{domxref("Window/beforeunload_event", "beforeunload")}}
