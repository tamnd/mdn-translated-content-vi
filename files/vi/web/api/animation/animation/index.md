---
title: "Animation: bộ khởi tạo Animation()"
short-title: Animation()
slug: Web/API/Animation/Animation
page-type: web-api-constructor
browser-compat: api.Animation.Animation
---

{{ APIRef("Web Animations") }}

Bộ khởi tạo **`Animation()`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về một thể hiện đối tượng `Animation` mới.

## Cú pháp

```js-nolint
new Animation()
new Animation(effect)
new Animation(effect, timeline)
```

### Tham số

- `effect` {{optional_inline}}
  - : Hiệu ứng đích, dưới dạng một đối tượng dựa trên giao diện {{domxref("AnimationEffect")}}, sẽ được gán cho hoạt ảnh. Dù trong tương lai có thể xuất hiện các hiệu ứng khác như `SequenceEffect` hoặc `GroupEffect`, kiểu hiệu ứng duy nhất hiện có là {{domxref("KeyframeEffect")}}. Giá trị này có thể là `null` (mặc định) để chỉ ra rằng sẽ không có hiệu ứng nào được áp dụng.
- `timeline` {{optional_inline}}
  - : Chỉ định `timeline` sẽ được liên kết với hoạt ảnh, dưới dạng một đối tượng thuộc kiểu dựa trên giao diện {{domxref("AnimationTimeline")}}. Giá trị mặc định là {{domxref("Document.timeline")}}, nhưng cũng có thể đặt thành `null`.

## Ví dụ

Trong [ví dụ Follow the White Rabbit](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#pausing_and_playing_animations), chúng ta có thể dùng bộ khởi tạo `Animation()` để tạo một `Animation` cho `rabbitDownKeyframes` bằng `timeline` của tài liệu:

```js
const whiteRabbit = document.getElementById("rabbit");

const rabbitDownKeyframes = new KeyframeEffect(
  whiteRabbit,
  [{ transform: "translateY(0%)" }, { transform: "translateY(100%)" }],
  { duration: 3000, fill: "forwards" },
);

const rabbitDownAnimation = new Animation(rabbitDownKeyframes);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
