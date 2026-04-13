---
title: CSSAnimation
slug: Web/API/CSSAnimation
page-type: web-api-interface
browser-compat: api.CSSAnimation
---

{{APIRef("Web Animations")}}

Giao diện **`CSSAnimation`** của {{domxref('Web Animations API','','',' ')}} đại diện cho một đối tượng {{domxref("Animation")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ lớp cha {{domxref("Animation")}}._

- {{domxref("CSSAnimation.animationName")}} {{ReadOnlyInline}}
  - : Trả về tên hoạt hình dưới dạng chuỗi.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ lớp cha {{domxref("Animation")}}._

## Ví dụ

### Kiểm tra CSSAnimation được trả về

Hoạt hình trong ví dụ dưới đây được định nghĩa trong CSS với tên `slide-in`. Gọi {{domxref("Element.getAnimations()")}} trả về một mảng tất cả các đối tượng {{domxref("Animation")}}. Trong trường hợp này, nó trả về một đối tượng `CSSAnimation`, đại diện cho hoạt hình được tạo trong CSS.

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
console.log(animations[0]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
