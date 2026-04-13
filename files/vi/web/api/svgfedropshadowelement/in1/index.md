---
title: "SVGFEDropShadowElement: in1 property"
short-title: in1
slug: Web/API/SVGFEDropShadowElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEDropShadowElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEDropShadowElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feDropShadow")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feDropShadow")}} được định nghĩa trong một bộ lọc, mỗi phần tử có thuộc tính `in` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="drop-shadow-filter">
      <!-- First Drop Shadow applied to the SourceGraphic -->
      <feDropShadow
        in="SourceGraphic"
        dx="10"
        dy="10"
        stdDeviation="5"
        flood-color="red" />
      <!-- Second Drop Shadow applied to the BackgroundImage -->
      <feDropShadow
        in="BackgroundImage"
        dx="-10"
        dy="-10"
        stdDeviation="5"
        flood-color="blue" />
    </filter>
  </defs>
  <!-- Rectangle with red shadow -->
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#drop-shadow-filter)" />
  <!-- Circle with blue shadow -->
  <circle
    cx="100"
    cy="100"
    r="50"
    fill="blue"
    filter="url(#drop-shadow-filter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in`:

```js
const dropShadows = document.querySelectorAll("feDropShadow");

console.log(dropShadows[0].in1.baseVal); // Output: "SourceGraphic"
console.log(dropShadows[1].in1.baseVal); // Output: "BackgroundImage"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
