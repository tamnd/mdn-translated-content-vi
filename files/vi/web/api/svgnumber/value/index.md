---
title: "SVGNumber: thuộc tính value"
short-title: value
slug: Web/API/SVGNumber/value
page-type: web-api-instance-property
browser-compat: api.SVGNumber.value
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`value`** của giao diện {{domxref("SVGNumber")}} đại diện cho số.

## Giá trị

Một số thực.

## Ví dụ

### Truy cập thuộc tính `value`

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <circle id="myCircle" cx="100" cy="100" r="50" fill="blue" />
</svg>
```

```js
const circleElement = document.getElementById("myCircle");

// Access the radius (r) value property
const radiusValue = circleElement.r.baseVal.value;

console.log(radiusValue); // Output: 50
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
