---
title: "SVGGraphicsElement: getScreenCTM() method"
short-title: getScreenCTM()
slug: Web/API/SVGGraphicsElement/getScreenCTM
page-type: web-api-instance-method
browser-compat: api.SVGGraphicsElement.getScreenCTM
---

{{APIRef("SVG")}}

Phương thức `getScreenCTM()` của giao diện {{domxref("SVGGraphicsElement")}} đại diện cho ma trận chuyển đổi hệ tọa độ của phần tử hiện tại sang hệ tọa độ của viewport SVG cho đoạn tài liệu SVG.

## Cú pháp

```js-nolint
getScreenCTM()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DOMMatrix")}}.

## Ví dụ

### Lấy ma trận biến đổi màn hình

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="400">
  <!-- Hình tròn với dịch chuyển và tỷ lệ -->
  <circle
    id="circle"
    cx="50"
    cy="50"
    r="30"
    fill="blue"
    transform="translate(100, 150) scale(2)" />
</svg>
```

```js
const circle = document.getElementById("circle");

// Lấy ma trận biến đổi màn hình hiện tại
const screenCTM = circle.getScreenCTM();

console.log("Screen transformation matrix:");
console.log(
  `a: ${screenCTM.a}, b: ${screenCTM.b}, c: ${screenCTM.c}, d: ${screenCTM.d}, e: ${screenCTM.e}, f: ${screenCTM.f}`,
);
// Output: a: 2, b: 0, c: 0, d: 2, e: 100, f: 150
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
