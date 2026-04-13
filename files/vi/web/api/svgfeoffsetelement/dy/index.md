---
title: "SVGFEOffsetElement: dy property"
short-title: dy
slug: Web/API/SVGFEOffsetElement/dy
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.dy
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`dy`** của giao diện {{domxref("SVGFEOffsetElement")}} phản ánh thuộc tính {{SVGAttr("dy")}} của phần tử {{SVGElement("feOffset")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `dy`

Trong ví dụ này, chúng ta truy cập lượng dịch chuyển dọc của phần tử `<feOffset>` bằng cách sử dụng thuộc tính chỉ đọc `dy` của giao diện `SVGFEOffsetElement`.

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

// Access the dy property
console.log(offsetElement.dy.baseVal); // Output: 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
