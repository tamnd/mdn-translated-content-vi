---
title: KeyframeEffect
slug: Web/API/KeyframeEffect
page-type: web-api-interface
browser-compat: api.KeyframeEffect
---

{{ APIRef("Web Animations") }}

Giao diện **`KeyframeEffect`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) cho phép chúng ta tạo tập hợp các thuộc tính và giá trị có thể hoạt hình, được gọi là **keyframe**. Những thứ này sau đó có thể được phát bằng hàm khởi tạo {{domxref("Animation.Animation", "Animation()")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("KeyframeEffect.KeyframeEffect", "KeyframeEffect()")}}
  - : Trả về một phiên bản đối tượng `KeyframeEffect` mới, đồng thời cho phép bạn sao chép một phiên bản đối tượng keyframe effect hiện có.

## Thuộc tính phiên bản

- {{domxref("KeyframeEffect.target")}}
  - : Lấy và đặt phần tử, hoặc phần tử gốc của phần tử giả, đang được hoạt hình bởi đối tượng này. Có thể là `null` cho các hoạt hình không nhắm mục tiêu vào một phần tử hoặc phần tử giả cụ thể.
- {{domxref("KeyframeEffect.pseudoElement")}}
  - : Lấy và đặt bộ chọn của phần tử giả đang được hoạt hình bởi đối tượng này. Có thể là `null` cho các hoạt hình không nhắm mục tiêu vào phần tử giả.
- {{domxref("KeyframeEffect.iterationComposite")}}
  - : Lấy và đặt thao tác tổng hợp lặp để giải quyết các thay đổi giá trị thuộc tính của keyframe effect này.
- {{domxref("KeyframeEffect.composite")}}
  - : Lấy và đặt thuộc tính thao tác tổng hợp để giải quyết các thay đổi giá trị thuộc tính giữa keyframe effect này và các keyframe effect khác.

## Phương thức phiên bản

_Giao diện này kế thừa một số phương thức từ lớp cha {{domxref("AnimationEffect")}}._

- {{domxref("AnimationEffect.getComputedTiming()")}}
  - : Trả về các giá trị thời gian được tính toán hiện tại cho keyframe effect này.
- {{domxref("KeyframeEffect.getKeyframes()")}}
  - : Trả về các keyframe được tính toán tạo nên effect này cùng với các offset keyframe được tính toán của chúng.
- {{domxref("AnimationEffect.getTiming()")}}
  - : Trả về đối tượng liên kết với hoạt hình chứa tất cả các giá trị thời gian của hoạt hình.
- {{domxref("KeyframeEffect.setKeyframes()")}}
  - : Thay thế tập hợp các keyframe tạo nên effect này.
- {{domxref("AnimationEffect.updateTiming()")}}
  - : Cập nhật các thuộc tính thời gian được chỉ định.

## Ví dụ

Trong ví dụ sau, hàm khởi tạo KeyframeEffect được sử dụng để tạo tập hợp các keyframe quy định cách biểu tượng cảm xúc rofl nên lăn trên sàn:

```js
const emoji = document.querySelector("div"); // element to animate

const rollingKeyframes = new KeyframeEffect(
  emoji,
  [
    { transform: "translateX(0) rotate(0)" }, // keyframe
    { transform: "translateX(200px) rotate(1.3turn)" }, // keyframe
  ],
  {
    // keyframe options
    duration: 2000,
    direction: "alternate",
    easing: "ease-in-out",
    iterations: "Infinity",
  },
);

const rollingAnimation = new Animation(rollingKeyframes, document.timeline);

// play rofl animation
rollingAnimation.play();
```

```html
<div>🤣</div>
```

```css hidden
body {
  box-shadow: 0 5px 5px pink;
}

div {
  width: fit-content;
  margin-left: calc(50% - 132px);
  font-size: 64px;
  user-select: none;
  margin-top: 1rem;
}
```

{{ EmbedLiveSample("Examples", "100%", "120") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
