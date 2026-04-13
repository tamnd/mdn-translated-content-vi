---
title: "KeyframeEffect: phương thức getKeyframes()"
short-title: getKeyframes()
slug: Web/API/KeyframeEffect/getKeyframes
page-type: web-api-instance-method
browser-compat: api.KeyframeEffect.getKeyframes
---

{{ APIRef("Web Animations") }}

Phương thức **`getKeyframes()`** của {{domxref("KeyframeEffect")}} trả về một mảng các keyframe được tính toán tạo nên hoạt hình này cùng với các offset được tính toán của chúng.

## Cú pháp

```js-nolint
getKeyframes()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một chuỗi các đối tượng với định dạng sau:

- các cặp giá trị thuộc tính
  - : Nhiều cặp giá trị thuộc tính được chứa trong mỗi keyframe của hoạt hình.
- `offset`
  - : Offset của keyframe được chỉ định là số từ `0.0` đến `1.0` bao gồm, hoặc `null`. Điều này tương đương với việc chỉ định trạng thái bắt đầu và kết thúc theo phần trăm trong CSS stylesheets sử dụng `@keyframes`. Sẽ là `null` nếu keyframe được tự động giãn cách.
- `computedOffset`
  - : Offset được tính toán cho keyframe này, được tính khi danh sách các keyframe được tính toán được tạo. Không giống như **`offset`** ở trên, **`computedOffset`** không bao giờ là `null`.
- `easing`
  - : [Hàm easing](/en-US/docs/Web/CSS/Reference/Values/easing-function) được sử dụng từ keyframe này đến keyframe tiếp theo trong chuỗi.
- `composite`
  - : Thao tác {{domxref("KeyframeEffect.composite")}} được sử dụng để kết hợp các giá trị được chỉ định trong keyframe này với giá trị bên dưới. Sẽ vắng mặt nếu thao tác tổng hợp được chỉ định trên effect đang được sử dụng.

## Ví dụ

Trong ví dụ sau, chúng ta có thể kiểm tra hoạt hình lăn để xem các keyframe của nó bằng phương thức `getKeyframes()`:

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
rollingAnimation.play();

// Array [ {…}, {…} ]
console.log(rollingAnimation.effect.getKeyframes());
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
- Phương thức của đối tượng {{domxref("KeyframeEffect")}}.
