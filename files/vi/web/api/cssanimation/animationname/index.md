---
title: "CSSAnimation: thuộc tính animationName"
short-title: animationName
slug: Web/API/CSSAnimation/animationName
page-type: web-api-instance-property
browser-compat: api.CSSAnimation.animationName
---

{{APIRef("Web Animations")}}

Thuộc tính **`animationName`** của giao diện {{domxref("CSSAnimation")}} trả về {{CSSXref("animation-name")}}. Thuộc tính này chỉ định một hoặc nhiều at-rule keyframe mô tả hoạt hình được áp dụng cho phần tử.

## Giá trị

Một chuỗi.

## Ví dụ

### Trả về animationName

Hoạt hình trong ví dụ dưới đây được định nghĩa trong CSS với tên `slide-in`. Gọi {{domxref("Element.getAnimations()")}} trả về một mảng tất cả các đối tượng {{domxref("Animation")}}. Thuộc tính `animationName` trả về tên được đặt cho hoạt hình, trong trường hợp này là `slide-in`.

```css
.animate {
  animation: slide-in 0.7s both;
}

@keyframes slide-in {
  0% {
    transform: translateY(-1000px);
  }
  100% {
    transform: translateY(0);
  }
}
```

```js
let animations = document.querySelector(".animate").getAnimations();
console.log(animations[0].animationName);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
