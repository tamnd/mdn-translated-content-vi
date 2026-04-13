---
title: "SVGFEDropShadowElement: stdDeviationY property"
short-title: stdDeviationY
slug: Web/API/SVGFEDropShadowElement/stdDeviationY
page-type: web-api-instance-property
browser-compat: api.SVGFEDropShadowElement.stdDeviationY
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`stdDeviationY`** của giao diện {{domxref("SVGFEDropShadowElement")}} phản ánh thành phần Y (có thể được tính toán tự động) của thuộc tính {{SVGAttr("stdDeviation")}} của phần tử {{SVGElement("feDropShadow")}} đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumber")}}.

## Ví dụ

### Truy cập giá trị `stdDeviationY`

Trong ví dụ này, chúng ta lấy độ lệch chuẩn dọc cho thao tác làm mờ của `<feDropShadow>` bằng cách sử dụng thuộc tính chỉ đọc `stdDeviationY` của giao diện `SVGFEDropShadowElement`.

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="drop-shadow-filter">
      <!-- Drop Shadow with stdDeviationY property set to 10 for vertical blur -->
      <feDropShadow
        in="SourceGraphic"
        dx="10"
        dy="10"
        stdDeviation="5 10"
        flood-color="gray" />
    </filter>
  </defs>

  <!-- Rectangle with a gray shadow -->
  <rect
    x="50"
    y="50"
    width="100"
    height="100"
    fill="red"
    filter="url(#drop-shadow-filter)" />
</svg>
```

```js
const dropShadow = document.querySelector("feDropShadow");

console.log(dropShadow.stdDeviationY.baseVal); // Output: 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumber")}}
