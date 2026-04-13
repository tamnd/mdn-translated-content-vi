---
title: "SVGFEGaussianBlurElement: setStdDeviation() method"
short-title: setStdDeviation()
slug: Web/API/SVGFEGaussianBlurElement/setStdDeviation
page-type: web-api-instance-method
browser-compat: api.SVGFEGaussianBlurElement.setStdDeviation
---

{{APIRef("SVG")}}

Phương thức `setStdDeviation()` của giao diện {{domxref("SVGFEGaussianBlurElement")}} đặt các giá trị cho thuộc tính {{SVGAttr("stdDeviation")}}.

## Cú pháp

```js-nolint
setStdDeviation(x, y)
```

### Tham số

- `x`
  - : Một số thực đại diện cho thành phần X của thuộc tính {{SVGAttr("stdDeviation")}}.
- `y`
  - : Một số thực đại diện cho thành phần Y của thuộc tính {{SVGAttr("stdDeviation")}}.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

## Ví dụ

### Sử dụng `setStdDeviation()`

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="gaussian-blur-filter">
      <feGaussianBlur
        in="SourceGraphic"
        stdDeviation="5 5"
        result="blurred-graphic" />
    </filter>
  </defs>

  <!-- Rectangle with an initial blur effect -->
  <rect
    x="50"
    y="50"
    width="100"
    height="100"
    fill="hotpink"
    filter="url(#gaussian-blur-filter)" />
</svg>

<!-- Button to update the blur -->
<button id="updateBlur">Update Blur</button>
```

```js
// Get the feGaussianBlur element
const gaussianBlur = document.querySelector("feGaussianBlur");

// Button to trigger the update
document.getElementById("updateBlur").addEventListener("click", () => {
  // Change the standard deviation (blur radius) of the blur effect
  gaussianBlur.setStdDeviation(15, 20); // Update to X: 15, Y: 20
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedLength")}}
