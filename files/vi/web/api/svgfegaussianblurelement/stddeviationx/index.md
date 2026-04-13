---
title: "SVGFEGaussianBlurElement: stdDeviationX property"
short-title: stdDeviationX
slug: Web/API/SVGFEGaussianBlurElement/stdDeviationX
page-type: web-api-instance-property
browser-compat: api.SVGFEGaussianBlurElement.stdDeviationX
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`stdDeviationX`** của giao diện {{domxref("SVGFEGaussianBlurElement")}} phản ánh thành phần X (có thể được tính toán tự động) của thuộc tính {{SVGAttr("stdDeviation")}} của phần tử {{SVGElement("feGaussianBlur")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `stdDeviationX`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="gaussian-blur-filter">
      <!-- Apply Gaussian Blur with stdDeviationX set to 5 and stdDeviationY set to 10 -->
      <feGaussianBlur
        in="SourceGraphic"
        stdDeviation="5 10"
        result="blurred-graphic" />
    </filter>
  </defs>

  <!-- Rectangle with a Gaussian blur effect -->
  <rect
    x="50"
    y="50"
    width="100"
    height="100"
    fill="hotpink"
    filter="url(#gaussian-blur-filter)" />
</svg>
```

```js
// Select the feGaussianBlur element
const gaussianBlur = document.querySelector("feGaussianBlur");

// Access the stdDeviationX value
console.log(gaussianBlur.stdDeviationX.baseVal); // Output: 5
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
