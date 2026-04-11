---
title: "SVGMarkerElement: setOrientToAngle() method"
short-title: setOrientToAngle()
slug: Web/API/SVGMarkerElement/setOrientToAngle
page-type: web-api-instance-method
browser-compat: api.SVGMarkerElement.setOrientToAngle
---

{{APIRef("SVG")}}

Phương thức **`setOrientToAngle()`** của giao diện {{domxref("SVGMarkerElement")}} đặt giá trị của thuộc tính `orient` thành giá trị trong {{domxref("SVGAngle")}} được truyền vào.

## Cú pháp

```js-nolint
setOrientToAngle(angle)
```

### Tham số

- `angle`
  - : Một {{domxref("SVGAngle")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ sau, giá trị của thuộc tính `orient` được cập nhật bằng `setOrientToAngle()` sử dụng một {{domxref("SVGAngle")}} được tạo bởi {{domxref("SVGSVGElement.createSVGAngle()")}}.

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
let svg = document.getElementById("svg");
let marker = document.getElementById("arrow");
console.log(marker.orientAngle.baseVal.value); // value in SVG above - 90
let angle = svg.createSVGAngle();
angle.value = "110";
marker.setOrientToAngle(angle);
console.log(marker.orientAngle.baseVal.value); // new value - 110
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
