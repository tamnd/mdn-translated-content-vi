---
title: "HTMLInputElement: thuộc tính alpha"
short-title: alpha
slug: Web/API/HTMLInputElement/alpha
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLInputElement.alpha
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Thuộc tính **`alpha`** của giao diện {{domxref("HTMLInputElement")}} phản ánh thuộc tính [`alpha`](/en-US/docs/Web/HTML/Reference/Elements/input/color#alpha) của phần tử {{htmlelement("input")}}, cho biết liệu thành phần alpha của màu CSS có thể được người dùng cuối thao tác và không nhất thiết phải hoàn toàn trong suốt. Nó chỉ liên quan đến các điều khiển [color](/en-US/docs/Web/HTML/Reference/Elements/input/color).

## Giá trị

Một giá trị logic.

## Ví dụ

```html
<input id="color-picker" type="color" alpha />
```

```js
const colorInput = document.getElementById("color-picker");

if (colorInput.alpha) {
  // Giá trị màu chứa thành phần alpha
} else {
  // Chúng ta có giá trị màu hoàn toàn trong suốt
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color)
