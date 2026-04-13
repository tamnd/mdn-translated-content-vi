---
title: "KeyframeEffect: thuộc tính target"
short-title: target
slug: Web/API/KeyframeEffect/target
page-type: web-api-instance-property
browser-compat: api.KeyframeEffect.target
---

{{ APIRef("Web Animations") }}

Thuộc tính **`target`** của giao diện {{domxref("KeyframeEffect")}} đại diện cho phần tử hoặc phần tử giả đang được hoạt hình. Có thể là `null` cho các hoạt hình không nhắm mục tiêu vào một phần tử cụ thể. Nó hoạt động như cả getter lẫn setter, ngoại trừ với các hoạt hình và transition được tạo bởi CSS.

## Giá trị

Một {{domxref("Element")}} hoặc `null`.

## Ví dụ

Trong ví dụ sau, `emoji` đã được đặt làm phần tử `target` để hoạt hình:

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

// logs "<div>🤣</div>"
console.log(rollingKeyframes.target);
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
- Thuộc tính của đối tượng {{domxref("KeyframeEffect")}}.
