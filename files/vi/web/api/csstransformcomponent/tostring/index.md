---
title: "CSSTransformComponent: toString() method"
short-title: toString()
slug: Web/API/CSSTransformComponent/toString
page-type: web-api-instance-method
browser-compat: api.CSSTransformComponent.toString
---

{{APIRef("CSS Typed OM")}}

Phương thức **`toString()`** của giao diện {{domxref("CSSTransformComponent")}} là {{Glossary("stringifier")}} trả về hàm [CSS Transforms](/en-US/docs/Web/CSS/Guides/Transforms).

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Chuỗi ở dạng [hàm transform](/en-US/docs/Web/CSS/Reference/Values/transform-function) CSS.

Điều này sẽ sử dụng giá trị của `is2D` để trả về transform 2D hoặc 3D. Ví dụ nếu thành phần đại diện cho {{domxref("CSSRotate")}} và `is2D` là false thì chuỗi được trả về sẽ ở dạng hàm transform CSS {{cssxref("transform-function/rotate3d", "rotate3d()")}}. Nếu true thì chuỗi được trả về sẽ ở dạng hàm 2 chiều {{cssxref("transform-function/rotate", "rotate()")}}.

## Ví dụ

Đang cập nhật

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
