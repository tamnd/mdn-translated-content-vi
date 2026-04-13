---
title: CSSTransition
slug: Web/API/CSSTransition
page-type: web-api-interface
browser-compat: api.CSSTransition
---

{{APIRef("Web Animations")}}

Giao diện **`CSSTransition`** của {{domxref('Web Animations API','','',' ')}} đại diện cho đối tượng {{domxref("Animation")}} được sử dụng cho [CSS Transition](/en-US/docs/Web/CSS/Guides/Transitions).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ lớp cha, {{domxref("Animation")}}._

- {{domxref("CSSTransition.transitionProperty")}} {{ReadOnlyInline}}
  - : Trả về tên thuộc tính CSS của transition dưới dạng chuỗi.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ lớp cha, {{domxref("Animation")}}._

Không có phương thức cụ thể.

## Ví dụ

### Kiểm tra CSSTransition được trả về

Transition trong ví dụ sau thay đổi chiều rộng của hộp khi di chuột. Gọi {{domxref("Element.getAnimations()")}} trả về một mảng tất cả các đối tượng {{domxref("Animation")}}. Trong trường hợp của chúng tôi, điều này trả về đối tượng `CSSTransition`, đại diện cho hoạt ảnh được tạo.

```css
.box {
  background-color: #165baa;
  color: white;
  width: 100px;
  height: 100px;
  transition: width 4s;
}

.box:hover {
  width: 200px;
}
```

```js
const item = document.querySelector(".box");
item.addEventListener("transitionrun", () => {
  let animations = document.querySelector(".box").getAnimations();
  console.log(animations[0]);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
