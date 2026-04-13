---
title: AnimationEffect
slug: Web/API/AnimationEffect
page-type: web-api-interface
browser-compat: api.AnimationEffect
---

{{ APIRef("Web Animations") }}

Giao diện `AnimationEffect` của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) là một giao diện biểu diễn các hiệu ứng hoạt ảnh.

`AnimationEffect` là một giao diện trừu tượng nên không thể được khởi tạo trực tiếp. Tuy nhiên, các giao diện cụ thể như {{domxref("KeyframeEffect")}} kế thừa từ nó, và các thể hiện của những giao diện này có thể được truyền cho các đối tượng {{domxref("Animation")}} để phát, đồng thời cũng có thể được [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations) và [Transitions](/en-US/docs/Web/CSS/Guides/Transitions) sử dụng.

## Phương thức thể hiện

- {{domxref("AnimationEffect.getTiming()")}}
  - : Trả về đối tượng liên kết với hoạt ảnh, chứa tất cả các giá trị thời gian của hoạt ảnh.
- {{domxref("AnimationEffect.getComputedTiming()")}}
  - : Trả về các thuộc tính thời gian đã được tính toán cho `AnimationEffect` này.
- {{domxref("AnimationEffect.updateTiming()")}}
  - : Cập nhật các thuộc tính thời gian đã chỉ định của `AnimationEffect` này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation.effect")}}
