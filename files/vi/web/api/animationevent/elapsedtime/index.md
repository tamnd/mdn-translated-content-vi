---
title: "AnimationEvent: thuộc tính elapsedTime"
short-title: elapsedTime
slug: Web/API/AnimationEvent/elapsedTime
page-type: web-api-instance-property
browser-compat: api.AnimationEvent.elapsedTime
---

{{APIRef("Web Animations")}}

Thuộc tính chỉ đọc **`AnimationEvent.elapsedTime`** là một giá trị `float` cho biết khoảng thời gian hoạt ảnh đã chạy, tính bằng giây, tại thời điểm sự kiện này được kích hoạt, không bao gồm mọi khoảng thời gian hoạt ảnh bị tạm dừng. Với sự kiện {{domxref("Element/animationstart_event", "animationstart")}}, `elapsedTime` là `0.0` trừ khi có giá trị âm cho {{cssxref("animation-delay")}}, trong trường hợp đó sự kiện sẽ được kích hoạt với `elapsedTime` chứa `(-1 * delay)`.

## Giá trị

Một `float` cho biết khoảng thời gian tính bằng giây.

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
