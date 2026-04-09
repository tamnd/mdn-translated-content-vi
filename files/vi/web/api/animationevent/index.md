---
title: AnimationEvent
slug: Web/API/AnimationEvent
page-type: web-api-interface
browser-compat: api.AnimationEvent
---

{{APIRef("Web Animations")}}

Giao diện **`AnimationEvent`** biểu diễn các sự kiện cung cấp thông tin liên quan tới [hoạt ảnh](/en-US/docs/Web/CSS/Guides/Animations/Using).

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("AnimationEvent.AnimationEvent", "AnimationEvent()")}}
  - : Tạo một sự kiện `AnimationEvent` với các tham số đã cho.

## Thuộc tính thể hiện

_Ngoài ra còn kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("AnimationEvent.animationName")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa giá trị của {{cssxref("animation-name")}} đã tạo ra hoạt ảnh.
- {{domxref("AnimationEvent.elapsedTime")}} {{ReadOnlyInline}}
  - : Một giá trị `float` cho biết khoảng thời gian hoạt ảnh đã chạy, tính bằng giây, tại thời điểm sự kiện này được kích hoạt, không bao gồm mọi khoảng thời gian hoạt ảnh bị tạm dừng. Với sự kiện `animationstart`, `elapsedTime` là `0.0` trừ khi có giá trị âm cho {{cssxref("animation-delay")}}, trong trường hợp đó sự kiện sẽ được kích hoạt với `elapsedTime` chứa `(-1 * delay)`.
- {{domxref("AnimationEvent.pseudoElement")}} {{ReadOnlyInline}}
  - : Một chuỗi, bắt đầu bằng `'::'`, chứa tên của [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) mà hoạt ảnh chạy trên đó. Nếu hoạt ảnh không chạy trên pseudo-element mà chạy trên chính phần tử, giá trị sẽ là một chuỗi rỗng: `''`.

## Phương thức thể hiện

_Kế thừa phương thức từ giao diện cha của nó là {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- Các thuộc tính và at-rule CSS liên quan đến hoạt ảnh: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timing-function")}}, {{cssxref("@keyframes")}}.
