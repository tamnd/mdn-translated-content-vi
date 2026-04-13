---
title: "SVGFEGaussianBlurElement: stdDeviationY property"
short-title: stdDeviationY
slug: Web/API/SVGFEGaussianBlurElement/stdDeviationY
page-type: web-api-instance-property
browser-compat: api.SVGFEGaussianBlurElement.stdDeviationY
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`stdDeviationY`** của giao diện {{domxref("SVGFEGaussianBlurElement")}} phản ánh thành phần Y (có thể được tính toán tự động) của thuộc tính {{SVGAttr("stdDeviation")}} của phần tử {{SVGElement("feGaussianBlur")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập thuộc tính `stdDeviationY`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="gaussian-blur-filter">
      <!-- Apply Gaussian Blur with stdDeviationY set to 5 and stdDeviationY set to 10 -->
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

// Access the stdDeviationY value
console.log(gaussianBlur.stdDeviationY.baseVal); // Output: 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
