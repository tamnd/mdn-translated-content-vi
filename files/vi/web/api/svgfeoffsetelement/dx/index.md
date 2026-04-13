---
title: "SVGFEOffsetElement: dx property"
short-title: dx
slug: Web/API/SVGFEOffsetElement/dx
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.dx
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`dx`** của giao diện {{domxref("SVGFEOffsetElement")}} phản ánh thuộc tính {{SVGAttr("dx")}} của phần tử {{SVGElement("feOffset")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `dx`

Trong ví dụ này, chúng ta truy cập lượng dịch chuyển ngang của phần tử `<feOffset>` bằng cách sử dụng thuộc tính chỉ đọc `dx` của giao diện `SVGFEOffsetElement`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="offsetFilter">
      <!-- Applies an offset to the SourceGraphic -->
      <feOffset in="SourceGraphic" dx="15" dy="10" />
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#offsetFilter)" />
</svg>
```

```js
// Select the feOffset element
const offsetElement = document.querySelector("feOffset");

// Access the dx property
console.log(offsetElement.dx.baseVal); // Output: 15
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
