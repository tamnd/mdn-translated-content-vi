---
title: "SVGMarkerElement: setOrientToAuto() method"
short-title: setOrientToAuto()
slug: Web/API/SVGMarkerElement/setOrientToAuto
page-type: web-api-instance-method
browser-compat: api.SVGMarkerElement.setOrientToAuto
---

{{APIRef("SVG")}}

Phương thức **`setOrientToAuto()`** của giao diện {{domxref("SVGMarkerElement")}} đặt giá trị của thuộc tính `orient` thành `auto`.

## Cú pháp

```js-nolint
setOrientToAuto()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ sau, giá trị của thuộc tính `orient` được cập nhật bằng `setOrientToAuto()`.

```html
<svg id="svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient="90">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
</svg>
```

```js
let marker = document.getElementById("arrow");
console.log(marker.orientAngle.baseVal.value);
marker.setOrientToAuto();
console.log(marker.orientAngle.baseVal.value);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
