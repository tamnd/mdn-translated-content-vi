---
title: "SVGFEDropShadowElement: dx property"
short-title: dx
slug: Web/API/SVGFEDropShadowElement/dx
page-type: web-api-instance-property
browser-compat: api.SVGFEDropShadowElement.dx
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`dx`** của giao diện {{domxref("SVGFEDropShadowElement")}} phản ánh thuộc tính {{SVGAttr("dx")}} của phần tử {{SVGElement("feDropShadow")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập giá trị `dx`

Trong ví dụ này, chúng ta lấy độ dịch chuyển ngang của `<feDropShadow>` bằng cách sử dụng thuộc tính chỉ đọc `dx` của giao diện `SVGFEDropShadowElement`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="drop-shadow-filter">
      <!-- Drop Shadow with dx property set to 10 -->
      <feDropShadow
        in="SourceGraphic"
        dx="10"
        dy="10"
        stdDeviation="5"
        flood-color="red" />
    </filter>
  </defs>

  <!-- Rectangle with a red shadow -->
  <rect
    x="20"
    y="20"
    width="100"
    height="100"
    fill="red"
    filter="url(#drop-shadow-filter)" />

  <!-- Circle with a red shadow -->
  <circle
    cx="100"
    cy="100"
    r="50"
    fill="blue"
    filter="url(#drop-shadow-filter)" />
</svg>
```

```js
const dropShadow = document.querySelector("feDropShadow");

console.log(dropShadow.dx.baseVal); // Output: 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
