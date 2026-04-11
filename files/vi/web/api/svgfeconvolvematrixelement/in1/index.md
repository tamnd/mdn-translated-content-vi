---
title: "SVGFEConvolveMatrixElement: in1 property"
short-title: in1
slug: Web/API/SVGFEConvolveMatrixElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEConvolveMatrixElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEConvolveMatrixElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feConvolveMatrix")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, phần tử `<feConvolveMatrix>` áp dụng một bộ lọc tích chập cho đồ họa đầu vào được chỉ định bởi thuộc tính `in`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="convolveFilter">
      <feConvolveMatrix
        in="SourceGraphic"
        order="3"
        kernelMatrix="0 -1 0 -1 4 -1 0 -1 0" />
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#convolveFilter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in` của phần tử `<feConvolveMatrix>`.

```js
const convolveMatrix = document.querySelector("feConvolveMatrix");

console.log(convolveMatrix.in1.baseVal); // Output: "SourceGraphic"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
