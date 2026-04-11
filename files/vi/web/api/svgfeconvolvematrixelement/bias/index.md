---
title: "SVGFEConvolveMatrixElement: bias property"
short-title: bias
slug: Web/API/SVGFEConvolveMatrixElement/bias
page-type: web-api-instance-property
browser-compat: api.SVGFEConvolveMatrixElement.bias
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`bias`** của giao diện {{domxref("SVGFEConvolveMatrixElement")}} phản ánh thuộc tính {{SVGAttr("bias")}} của phần tử {{SVGElement("feConvolveMatrix")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `bias`

Thuộc tính `bias` được dùng để điều chỉnh độ sáng của đầu ra.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="convolveFilterWithBias">
      <feConvolveMatrix
        in="SourceGraphic"
        order="3"
        kernelMatrix="0 -1 0 -1 5 -1 0 -1 0"
        bias="0.25" />
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="lightblue"
    filter="url(#convolveFilterWithBias)" />
</svg>
```

```js
const convolveMatrix = document.querySelector("feConvolveMatrix");

console.log(convolveMatrix.bias.baseVal); // Output: 0.25
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
