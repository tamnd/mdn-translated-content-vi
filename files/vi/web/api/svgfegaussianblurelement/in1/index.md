---
title: "SVGFEGaussianBlurElement: in1 property"
short-title: in1
slug: Web/API/SVGFEGaussianBlurElement/in1
page-type: web-api-instance-property
browser-compat: api.SVGFEGaussianBlurElement.in1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`in1`** của giao diện {{domxref("SVGFEGaussianBlurElement")}} phản ánh thuộc tính {{SVGAttr("in")}} của phần tử {{SVGElement("feGaussianBlur")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedString")}}.

## Ví dụ

Trong ví dụ này, hai phần tử {{SVGElement("feGaussianBlur")}} được định nghĩa trong một bộ lọc, mỗi phần tử có thuộc tính `in` khác nhau.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="gaussian-blur-filter">
      <!-- Gaussian blur applied to the SourceGraphic -->
      <feGaussianBlur
        in="SourceGraphic"
        stdDeviation="5"
        result="blurred-source" />
      <!-- Gaussian blur applied to the BackgroundImage -->
      <feGaussianBlur
        in="BackgroundImage"
        stdDeviation="10"
        result="blurred-background" />
    </filter>
  </defs>

  <!-- Rectangle with SourceGraphic blur effect -->
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="rebeccapurple"
    filter="url(#gaussian-blur-filter)" />

  <!-- Circle with BackgroundImage blur effect -->
  <circle
    cx="150"
    cy="100"
    r="50"
    fill="hotpink"
    filter="url(#gaussian-blur-filter)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `in`:

```js
// Get all feGaussianBlur elements
const gaussianBlurs = document.querySelectorAll("feGaussianBlur");

// Access the 'in' attribute values
console.log(gaussianBlurs[0].in1.baseVal); // Output: "SourceGraphic"
console.log(gaussianBlurs[1].in1.baseVal); // Output: "BackgroundImage"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedString")}}
