---
title: "SVGFEComponentTransferElement: in1 property"
short-title: in1
slug: Web/API/SVGFEComponentTransferElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEComponentTransferElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEComponentTransferElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feComponentTransfer")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feComponentTransfer")}} được định nghĩa trong một bộ lọc, mỗi phần tử có một thuộc tính `in` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <filter id="filter1">
    <feComponentTransfer in="SourceGraphic">
      <feFuncR type="table" tableValues="0 1" />
    </feComponentTransfer>
    <feComponentTransfer in="BackgroundImage">
      <feFuncR type="table" tableValues="0.5 1" />
    </feComponentTransfer>
  </filter>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#filter1)" />
  <circle cx="100" cy="100" r="50" fill="blue" filter="url(#filter1)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in`:

```js
const componentTransfers = document.querySelectorAll("feComponentTransfer");

console.log(componentTransfers[0].in1.baseVal); // Output: "SourceGraphic"
console.log(componentTransfers[1].in1.baseVal); // Output: "BackgroundImage"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
