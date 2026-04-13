---
title: GestureEvent
slug: Web/API/GestureEvent
page-type: web-api-interface
status:
  - non-standard
browser-compat: api.GestureEvent
---

{{APIRef("UI Events")}}{{Non-standard_header}}

**`GestureEvent`** là giao diện độc quyền dành riêng cho WebKit, cung cấp thông tin về các cử chỉ đa điểm chạm. Các sự kiện sử dụng giao diện này bao gồm {{domxref("Element/gesturestart_event", "gesturestart")}}, {{domxref("Element/gesturechange_event", "gesturechange")}} và {{domxref("Element/gestureend_event", "gestureend")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha là {{domxref("UIEvent")}} và {{domxref("Event")}}._

- {{domxref("GestureEvent.rotation")}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Sự thay đổi về góc quay (tính bằng độ) kể từ khi sự kiện bắt đầu. Giá trị dương cho biết quay theo chiều kim đồng hồ; giá trị âm cho biết quay ngược chiều kim đồng hồ. Giá trị ban đầu: `0.0`.
- {{domxref("GestureEvent.scale")}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Khoảng cách giữa hai ngón tay kể từ khi sự kiện bắt đầu. Được biểu thị dưới dạng bội số dấu phẩy động của khoảng cách ban đầu giữa các ngón tay lúc bắt đầu cử chỉ. Các giá trị dưới 1.0 cho biết kẹp vào (thu nhỏ). Các giá trị trên 1.0 cho biết mở ra (phóng to). Giá trị ban đầu: `1.0`.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha là {{domxref("UIEvent")}} và {{domxref("Event")}}._

- {{domxref("GestureEvent.initGestureEvent()")}} {{Non-standard_Inline}}
  - : Khởi tạo giá trị của `GestureEvent`. Nếu sự kiện đã được gửi đi, phương thức này không làm gì.

## Loại sự kiện cử chỉ

- {{domxref("Element/gesturestart_event", "gesturestart")}}
- {{domxref("Element/gesturechange_event", "gesturechange")}}
- {{domxref("Element/gestureend_event", "gestureend")}}

## Thông số kỹ thuật

_Không thuộc bất kỳ thông số kỹ thuật nào._ Apple có [mô tả tại Safari Developer Library](https://developer.apple.com/documentation/webkitjs/gestureevent).

## Tương thích trình duyệt

{{Compat}}
