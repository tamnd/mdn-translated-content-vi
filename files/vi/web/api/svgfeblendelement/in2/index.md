---
title: "SVGFEBlendElement: in2 property"
short-title: in2
slug: Web/API/SVGFEBlendElement/in2
page-type: web-api-instance-property
browser-compat: api.SVGFEBlendElement.in2
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in2`** của giao diện {{domxref("SVGFEBlendElement")}} phản ánh thuộc tính {{SVGAttr("in2")}} của phần tử đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feBlend")}} được định nghĩa trong một filter, mỗi phần tử có thuộc tính `in2` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="blend-filter">
    <feBlend in="SourceGraphic" in2="SourceAlpha" operator="over" />
    <feBlend in="SourceGraphic" in2="BackgroundImage" operator="in" />
  </filter>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#blend-filter)" />
  <circle cx="100" cy="100" r="50" fill="blue" filter="url(#blend-filter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in2`:

```js
const feBlends = document.querySelectorAll("feBlend");

console.log(feBlends[0].in2.baseVal); // Output: "SourceAlpha"
console.log(feBlends[1].in2.baseVal); // Output: "BackgroundImage"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
