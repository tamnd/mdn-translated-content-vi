---
title: "ShadowRoot: phương thức getAnimations()"
short-title: getAnimations()
slug: Web/API/ShadowRoot/getAnimations
page-type: web-api-instance-method
browser-compat: api.ShadowRoot.getAnimations
---

{{APIRef("Web Animations")}}

Phương thức **`getAnimations()`** của giao diện {{domxref("ShadowRoot")}} trả về một mảng gồm tất cả các đối tượng {{domxref("Animation")}} hiện đang có hiệu lực, mà phần tử đích của chúng là các phần tử hậu duệ của cây shadow. Mảng này bao gồm [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations), [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions), và [Web Animations](/en-US/docs/Web/API/Web_Animations_API).

## Cú pháp

```js-nolint
getAnimations()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} gồm các đối tượng {{domxref("Animation")}}, mỗi đối tượng biểu thị một hoạt ảnh hiện đang gắn với các phần tử là hậu duệ của {{domxref("ShadowRoot")}} mà nó được gọi trên.

## Ví dụ

Đoạn mã sau sẽ làm chậm tất cả các hoạt ảnh trong một cây shadow bằng cách giảm một nửa {{domxref("Animation.playbackRate")}} của chúng.

```js
let customElem = document.querySelector("my-shadow-dom-element");
let shadow = customElem.shadowRoot;
shadow.getAnimations().forEach((animation) => {
  animation.playbackRate *= 0.5;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations)
- [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions)
- {{domxref("Element.getAnimations()")}} - Chỉ lấy các hoạt ảnh trên một {{domxref("Element")}} duy nhất và các phần tử hậu duệ của nó.
- {{domxref("Animation")}}
