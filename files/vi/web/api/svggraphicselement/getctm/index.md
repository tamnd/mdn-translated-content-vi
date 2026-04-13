---
title: "SVGGraphicsElement: getCTM() method"
short-title: getCTM()
slug: Web/API/SVGGraphicsElement/getCTM
page-type: web-api-instance-method
browser-compat: api.SVGGraphicsElement.getCTM
---

{{APIRef("SVG")}}

Phương thức `getCTM()` của giao diện {{domxref("SVGGraphicsElement")}} đại diện cho ma trận chuyển đổi hệ tọa độ của phần tử hiện tại sang hệ tọa độ viewport SVG của nó.

## Cú pháp

```js-nolint
getCTM()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DOMMatrix")}}.

## Ví dụ

### Lấy ma trận biến đổi

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="400">
  <!-- Hình tròn được biến đổi bằng phép dịch chuyển -->
  <circle
    id="circle"
    cx="50"
    cy="50"
    r="30"
    fill="blue"
    transform="translate(100, 150)" />
</svg>
```

```js
const circle = document.getElementById("circle");

// Lấy ma trận biến đổi hiện tại
const ctm = circle.getCTM();

console.log("Matrix values:");
console.log(
  `a: ${ctm.a}, b: ${ctm.b}, c: ${ctm.c}, d: ${ctm.d}, e: ${ctm.e}, f: ${ctm.f}`,
);
// Output: Matrix values: a: 1, b: 0, c: 0, d: 1, e: 100, f: 150
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
