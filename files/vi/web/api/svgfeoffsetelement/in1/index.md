---
title: "SVGFEOffsetElement: in1 property"
short-title: in1
slug: Web/API/SVGFEOffsetElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEOffsetElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feOffset")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `in` của phần tử `<feOffset>`

Trong ví dụ này, chúng ta truy cập giá trị thuộc tính `in` của phần tử `<feOffset>` bằng cách sử dụng thuộc tính chỉ đọc `in1` của giao diện `SVGFEOffsetElement`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="offsetFilter">
      <!-- Applies an offset to the SourceGraphic -->
      <feOffset in="SourceGraphic" dx="10" dy="10" />
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

Chúng ta có thể truy cập thuộc tính `in` của phần tử `feOffset`.

```js
// Select the feOffset element
const offsetElement = document.querySelector("feOffset");

// Access the in1 property
console.log(offsetElement.in1.baseVal); // Output: "SourceGraphic"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
