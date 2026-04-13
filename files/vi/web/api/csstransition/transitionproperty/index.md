---
title: "CSSTransition: transitionProperty property"
short-title: transitionProperty
slug: Web/API/CSSTransition/transitionProperty
page-type: web-api-instance-property
browser-compat: api.CSSTransition.transitionProperty
---

{{APIRef("Web Animations")}}

Thuộc tính **`transitionProperty`** của giao diện {{domxref("CSSTransition")}} trả về **tên thuộc tính CSS transition đã được mở rộng** của transition. Đây là thuộc tính CSS dạng đầy đủ mà transition được tạo ra cho nó.

## Giá trị

Một chuỗi.

## Ví dụ

### Trả về transitionProperty

Transition trong ví dụ sau thay đổi chiều rộng của hộp khi di chuột. Gọi {{domxref("Element.getAnimations()")}} trả về một mảng tất cả các đối tượng {{domxref("Animation")}}. Trong trường hợp của chúng tôi, điều này trả về đối tượng `CSSTransition`, đại diện cho hoạt ảnh được tạo. Thuộc tính `transitionProperty` trả về thuộc tính mà transition được tạo ra cho nó, là `width`.

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
  console.log(animations[0].propertyName);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
