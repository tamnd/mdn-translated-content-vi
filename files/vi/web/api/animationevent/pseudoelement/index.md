---
title: "AnimationEvent: thuộc tính pseudoElement"
short-title: pseudoElement
slug: Web/API/AnimationEvent/pseudoElement
page-type: web-api-instance-property
browser-compat: api.AnimationEvent.pseudoElement
---

{{APIRef("Web Animations")}}

Thuộc tính chỉ đọc **`AnimationEvent.pseudoElement`** là một chuỗi, bắt đầu bằng `'::'`, chứa tên của [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) mà hoạt ảnh chạy trên đó.
Nếu hoạt ảnh không chạy trên pseudo-element mà chạy trên chính phần tử, giá trị sẽ là một chuỗi rỗng: `''`.

## Giá trị

Một chuỗi, bắt đầu bằng `'::'`, chứa tên của [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) mà hoạt ảnh chạy trên đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- Các thuộc tính và at-rule CSS liên quan đến hoạt ảnh: {{cssxref("animation")}},
  {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}},
  {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}},
  {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}},
  {{cssxref("animation-play-state")}}, {{cssxref("animation-timing-function")}},
  {{cssxref("@keyframes")}}.
- Giao diện {{domxref("AnimationEvent")}} mà nó thuộc về.
