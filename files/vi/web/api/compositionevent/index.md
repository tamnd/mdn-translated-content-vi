---
title: CompositionEvent
slug: Web/API/CompositionEvent
page-type: web-api-interface
browser-compat: api.CompositionEvent
---

{{APIRef("UI Events")}}

Giao diện DOM **`CompositionEvent`** biểu diễn các sự kiện xảy ra do người dùng nhập văn bản một cách gián tiếp.

{{InheritanceDiagram}}

## Constructor

- {{domxref("CompositionEvent.CompositionEvent()", "CompositionEvent()")}}
  - : Tạo một instance đối tượng `CompositionEvent` mới.

## Thuộc tính instance

_Giao diện này cũng kế thừa các thuộc tính của cha nó, {{domxref("UIEvent")}}, và tổ tiên của nó — {{domxref("Event")}}._

- {{domxref("CompositionEvent.data")}} {{ReadOnlyInline}}
  - : Trả về các ký tự được tạo bởi phương thức nhập đã kích hoạt sự kiện; giá trị cụ thể phụ thuộc vào loại sự kiện đã tạo ra đối tượng `CompositionEvent`.
- {{domxref("CompositionEvent.locale")}} {{ReadOnlyInline}} {{deprecated_inline}} {{Non-standard_Inline}}
  - : Trả về ngôn ngữ của phương thức nhập hiện tại (ví dụ, ngôn ngữ bố cục bàn phím nếu quá trình soạn thảo liên quan đến một {{glossary("Input method editor")}}).

## Phương thức instance

_Giao diện này cũng kế thừa các phương thức của cha nó, {{domxref("UIEvent")}}, và tổ tiên của nó — {{domxref("Event")}}._

- {{domxref("CompositionEvent.initCompositionEvent()")}} {{deprecated_inline}}
  - : Khởi tạo các thuộc tính của một đối tượng `CompositionEvent`.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [compositionstart](/en-US/docs/Web/API/Element/compositionstart_event)
- [compositionend](/en-US/docs/Web/API/Element/compositionend_event)
- [compositionupdate](/en-US/docs/Web/API/Element/compositionupdate_event)
- [UIEvent](/en-US/docs/Web/API/UIEvent)
- [Event](/en-US/docs/Web/API/Event)
