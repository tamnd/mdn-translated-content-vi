---
title: UIEvent
slug: Web/API/UIEvent
page-type: web-api-interface
browser-compat: api.UIEvent
---

{{APIRef("UI Events")}}

Giao diện **`UIEvent`** đại diện cho các sự kiện giao diện người dùng đơn giản. Nó là một phần của [UI Events](/en-US/docs/Web/API/UI_Events) API, bao gồm nhiều loại sự kiện và giao diện liên quan đến tương tác người dùng.

`UIEvent` được kế thừa từ {{domxref("Event")}}. Mặc dù phương thức {{domxref("UIEvent.initUIEvent()")}} được giữ lại để tương thích ngược, bạn nên tạo đối tượng `UIEvent` bằng hàm khởi tạo {{domxref("UIEvent.UIEvent", "UIEvent()")}}.

Nhiều giao diện là hậu duệ trực tiếp hoặc gián tiếp của giao diện này: {{domxref("MouseEvent")}}, {{domxref("TouchEvent")}}, {{domxref("FocusEvent")}}, {{domxref("KeyboardEvent")}}, {{domxref("WheelEvent")}}, {{domxref("InputEvent")}} và {{domxref("CompositionEvent")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("UIEvent.UIEvent()", "UIEvent()")}}
  - : Tạo một đối tượng `UIEvent`.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha, {{domxref("Event")}}._

- {{domxref("UIEvent.detail")}} {{ReadOnlyInline}}
  - : Trả về `long` với chi tiết về sự kiện, tùy thuộc vào loại sự kiện.
- {{domxref("UIEvent.sourceCapabilities")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về một phiên bản của giao diện `InputDeviceCapabilities`, cung cấp thông tin về thiết bị vật lý chịu trách nhiệm tạo ra sự kiện cảm ứng.
- {{domxref("UIEvent.view")}} {{ReadOnlyInline}}
  - : Trả về {{glossary("WindowProxy")}} chứa chế độ xem đã tạo ra sự kiện.
- {{domxref("UIEvent.which")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về `keyCode` số của phím được nhấn, hoặc mã ký tự (`charCode`) cho một phím chữ hoặc số được nhấn.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ lớp cha, {{domxref("Event")}}._

- {{domxref("UIEvent.initUIEvent()")}} {{Deprecated_Inline}}
  - : Khởi tạo đối tượng `UIEvent`. Nếu sự kiện đã được gửi đi, phương thức này không làm gì cả.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [UI Events API](/en-US/docs/Web/API/UI_Events)
- [Introduction to events](/en-US/docs/Learn_web_development/Core/Scripting/Events)
- {{domxref("Event")}}
