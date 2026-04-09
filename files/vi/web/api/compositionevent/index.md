---
title: CompositionEvent
slug: Web/API/CompositionEvent
page-type: web-api-interface
browser-compat: api.CompositionEvent
---

{{APIRef("UI Events")}}

DOM **`CompositionEvent`** biểu diễn các sự kiện xảy ra khi người dùng nhập văn bản theo cách gián tiếp.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("CompositionEvent.CompositionEvent()", "CompositionEvent()")}}
  - : Tạo một phiên bản đối tượng `CompositionEvent` mới.

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính của phần tử cha là {{domxref("UIEvent")}} và phần tử tổ tiên là {{domxref("Event")}}._

- {{domxref("CompositionEvent.data")}} {{ReadOnlyInline}}
  - : Trả về các ký tự do phương thức nhập đã tạo ra để phát sinh sự kiện; giá trị này thay đổi tùy theo loại sự kiện đã tạo ra đối tượng `CompositionEvent`.
- {{domxref("CompositionEvent.locale")}} {{ReadOnlyInline}} {{deprecated_inline}} {{Non-standard_Inline}}
  - : Trả về locale của phương thức nhập hiện tại (ví dụ: locale bố cục bàn phím nếu composition gắn với một {{glossary("Input method editor")}}).

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức của phần tử cha là {{domxref("UIEvent")}} và phần tử tổ tiên là {{domxref("Event")}}._

- {{domxref("CompositionEvent.initCompositionEvent()")}} {{deprecated_inline}}
  - : Khởi tạo các thuộc tính của một đối tượng `CompositionEvent`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [compositionstart](/en-US/docs/Web/API/Element/compositionstart_event)
- [compositionend](/en-US/docs/Web/API/Element/compositionend_event)
- [compositionupdate](/en-US/docs/Web/API/Element/compositionupdate_event)
- [UIEvent](/en-US/docs/Web/API/UIEvent)
- [Event](/en-US/docs/Web/API/Event)
