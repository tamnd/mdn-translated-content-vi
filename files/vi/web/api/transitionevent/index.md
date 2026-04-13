---
title: TransitionEvent
slug: Web/API/TransitionEvent
page-type: web-api-interface
browser-compat: api.TransitionEvent
---

{{APIRef("CSSOM")}}

Giao diện **`TransitionEvent`** biểu diễn các sự kiện cung cấp thông tin liên quan đến [transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("TransitionEvent.TransitionEvent", "TransitionEvent()")}}
  - : Tạo sự kiện `TransitionEvent` với các tham số đã cho.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ cha nó {{domxref("Event")}}_.

- {{domxref("TransitionEvent.propertyName")}} {{ReadOnlyInline}}
  - : Chuỗi chứa tên thuộc tính CSS liên quan đến transition.
- {{domxref("TransitionEvent.elapsedTime")}} {{ReadOnlyInline}}
  - : Số `float` cho biết thời gian transition đã chạy, tính bằng giây, khi sự kiện này được kích hoạt. Giá trị này không bị ảnh hưởng bởi thuộc tính {{cssxref("transition-delay")}}.
- {{domxref("TransitionEvent.pseudoElement")}} {{ReadOnlyInline}}
  - : Chuỗi bắt đầu bằng `::`, chứa tên của [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) mà hoạt ảnh chạy trên đó. Nếu transition không chạy trên phần tử giả mà trên phần tử, chuỗi rỗng: `''`.

## Các loại `TransitionEvent`

- {{domxref("Element/transitioncancel_event", "transitioncancel")}}
  - : Một {{domxref("Event")}} được kích hoạt khi [CSS transition](/en-US/docs/Web/CSS/Guides/Transitions) đã bị hủy.
- {{domxref("Element/transitionend_event", "transitionend")}}
  - : Một {{domxref("Event")}} được kích hoạt khi [CSS transition](/en-US/docs/Web/CSS/Guides/Transitions) đã hoàn thành phát.
- {{domxref("Element/transitionrun_event", "transitionrun")}}
  - : Một {{domxref("Event")}} được kích hoạt khi [CSS transition](/en-US/docs/Web/CSS/Guides/Transitions) được tạo (tức là khi nó được thêm vào tập hợp các transition đang chạy), mặc dù chưa nhất thiết bắt đầu.
- {{domxref("Element/transitionstart_event", "transitionstart")}}
  - : Một {{domxref("Event")}} được kích hoạt khi [CSS transition](/en-US/docs/Web/CSS/Guides/Transitions) đã bắt đầu chuyển đổi.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ cha nó {{domxref("Event")}}_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
- Thuộc tính CSS: {{cssxref("transition")}}, {{cssxref("transition-delay")}}, {{cssxref("transition-duration")}}, {{cssxref("transition-property")}}, {{cssxref("transition-timing-function")}}
- Quy tắc CSS: {{cssxref("@starting-style")}}
