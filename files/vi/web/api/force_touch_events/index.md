---
title: Force Touch events
slug: Web/API/Force_Touch_events
page-type: web-api-overview
status:
  - non-standard
---

{{DefaultAPISidebar("Force Touch Events")}}{{Non-standard_header}}

**Force Touch Events** là tính năng độc quyền dành riêng cho Apple, cho phép (khi phần cứng đầu vào hỗ trợ) các tương tác mới dựa trên mức độ nhấn của người dùng lên màn hình cảm ứng hoặc bàn di chuột.

## Sự kiện

- {{domxref("Element/webkitmouseforcewillbegin_event", "webkitmouseforcewillbegin")}} {{non-standard_inline}}
  - : Sự kiện này được kích hoạt trước sự kiện {{domxref("Element/mousedown_event", "mousedown")}}. Công dụng chính của nó là có thể bị {{domxref("Event.preventDefault()", "ngăn chặn mặc định", "", 1)}}.
- {{domxref("Element/webkitmouseforcedown_event", "webkitmouseforcedown")}} {{non-standard_inline}}
  - : Sự kiện này được kích hoạt sau sự kiện {{domxref("Element/mousedown_event", "mousedown")}} ngay khi đủ áp lực được áp dụng để đủ điều kiện là "force click".
- {{domxref("Element/webkitmouseforceup_event", "webkitmouseforceup")}} {{non-standard_inline}}
  - : Sự kiện này được kích hoạt sau sự kiện {{domxref("Element/webkitmouseforcedown_event", "webkitmouseforcedown")}} ngay khi áp lực đã giảm đủ để kết thúc "force click".
- {{domxref("Element/webkitmouseforcechanged_event", "webkitmouseforcechanged")}} {{non-standard_inline}}
  - : Sự kiện này được kích hoạt mỗi khi lượng áp lực thay đổi. Sự kiện này lần đầu kích hoạt sau sự kiện {{domxref("Element/mousedown_event", "mousedown")}} và ngừng kích hoạt trước sự kiện {{domxref("Element/mouseup_event", "mouseup")}}.

## Thuộc tính sự kiện

Thuộc tính sau đây được biết là có sẵn trên các đối tượng sự kiện {{domxref("Element/webkitmouseforcewillbegin_event", "webkitmouseforcewillbegin")}}, {{domxref("Element/mousedown_event", "mousedown")}}, {{domxref("Element/webkitmouseforcechanged_event", "webkitmouseforcechanged")}}, {{domxref("Element/webkitmouseforcedown_event", "webkitmouseforcedown")}}, {{domxref("Element/webkitmouseforceup_event", "webkitmouseforceup")}}, {{domxref("Element/mousemove_event", "mousemove")}} và {{domxref("Element/mouseup_event", "mouseup")}}:

- {{domxref("MouseEvent.webkitForce")}} {{non-standard_inline()}} {{ReadOnlyInline}}
  - : Lượng áp lực hiện đang được áp dụng lên bàn di chuột/màn hình cảm ứng.

## Hằng số

Các hằng số này hữu ích để xác định cường độ tương đối của áp lực được chỉ ra bởi {{domxref("MouseEvent.webkitForce")}}:

- {{domxref("MouseEvent.WEBKIT_FORCE_AT_MOUSE_DOWN_static", "MouseEvent.WEBKIT_FORCE_AT_MOUSE_DOWN")}} {{non-standard_inline}} {{ReadOnlyInline}}
  - : Lực tối thiểu cần thiết cho một cú click thông thường.
- {{domxref("MouseEvent.WEBKIT_FORCE_AT_FORCE_MOUSE_DOWN_static", "MouseEvent.WEBKIT_FORCE_AT_FORCE_MOUSE_DOWN")}} {{non-standard_inline}} {{ReadOnlyInline}}
  - : Lực tối thiểu cần thiết cho một force click.

## Thông số kỹ thuật

_Không thuộc bất kỳ thông số kỹ thuật nào._ Apple có [mô tả tại Mac Developer Library](https://developer.apple.com/library/archive/documentation/AppleApplications/Conceptual/SafariJSProgTopics/RespondingtoForceTouchEventsfromJavaScript.html).
