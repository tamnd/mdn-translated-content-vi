---
title: "Document: phương thức getAnimations()"
short-title: getAnimations()
slug: Web/API/Document/getAnimations
page-type: web-api-instance-method
browser-compat: api.Document.getAnimations
---

{{APIRef("Web Animations")}}

Phương thức `getAnimations()` của giao diện {{domxref("Document")}} trả về một mảng gồm tất cả các đối tượng {{domxref("Animation")}} hiện đang có hiệu lực mà các phần tử mục tiêu của chúng là hậu duệ của tài liệu. Mảng này bao gồm [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations), [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions), và [Web Animations](/en-US/docs/Web/API/Web_Animations_API).

## Cú pháp

```js-nolint
getAnimations()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng {{domxref("Animation")}}, mỗi đối tượng đại diện cho một animation hiện đang được liên kết với các phần tử là hậu duệ của {{domxref("Document")}} mà nó được gọi.

## Ví dụ

Đoạn mã sau đây sẽ làm chậm tất cả animation trên một trang bằng cách giảm một nửa {{domxref("Animation.playbackRate")}} của chúng.

```js
document.getAnimations().forEach((animation) => {
  animation.playbackRate *= 0.5;
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations)
- [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions)
- {{domxref("Element.getAnimations()")}} - Chỉ lấy các animation trên một {{domxref("Element")}} duy nhất và các hậu duệ của nó.
- {{domxref("Animation")}}
