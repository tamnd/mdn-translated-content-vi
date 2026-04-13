---
title: "SVGFETileElement: in1 property"
short-title: in1
slug: Web/API/SVGFETileElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFETileElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFETileElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feTile")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

### Truy cập thuộc tính `in` của phần tử `feTile`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="tileFilter">
      <!-- Lấp đầy SourceGraphic dưới dạng ô -->
      <feTile in="SourceGraphic" />
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="hotpink"
    filter="url(#tileFilter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in` của phần tử `feTile`.

```js
// Chọn phần tử feTile
const tileElement = document.querySelector("feTile");

// Truy cập thuộc tính in1
console.log(tileElement.in1.baseVal); // Output: "SourceGraphic"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
