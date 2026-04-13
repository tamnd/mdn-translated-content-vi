---
title: "SVGPatternElement: viewBox property"
short-title: viewBox
slug: Web/API/SVGPatternElement/viewBox
page-type: web-api-instance-property
browser-compat: api.SVGPatternElement.viewBox
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`viewBox`** của giao diện {{domxref("SVGPatternElement")}} phản ánh thuộc tính {{SVGAttr("viewBox")}} của phần tử đã cho. Nó đại diện cho các giá trị `x`, `y`, `width` và `height` xác định vùng được sử dụng cho `viewBox` của mẫu.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedRect")}}.

## Ví dụ

Với SVG sau đây, chúng ta có thể sử dụng thuộc tính `viewBox` để lấy kích thước của `viewBox` cho phần tử mẫu:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <pattern id="pattern1" width="10" height="10" viewBox="0 0 50 50">
      <circle cx="25" cy="25" r="25" fill="blue" />
    </pattern>
  </defs>
  <rect x="0" y="0" width="100" height="100" fill="url(#pattern1)" />
</svg>
```

Chúng ta có thể truy cập thuộc tính `viewBox`:

```js
const pattern = document.querySelector("pattern");

console.log(pattern.viewBox.baseVal); // output: DOMRect {x: 0, y: 0, width: 50, height: 50}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("viewBox")}}
