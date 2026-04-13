---
title: "SVGTextPositioningElement: thuộc tính rotate"
short-title: rotate
slug: Web/API/SVGTextPositioningElement/rotate
page-type: web-api-instance-property
browser-compat: api.SVGTextPositioningElement.rotate
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`rotate`** của giao diện {{domxref("SVGTextPositioningElement")}} phản ánh góc xoay của các ký tự văn bản riêng lẻ, theo thuộc tính {{SVGAttr("rotate")}} của phần tử đã cho.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedNumberList")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <text x="10" y="20" rotate="45">Hello</text>
  <text x="50" y="50" rotate="90">World</text>
</svg>
```

Chúng ta có thể truy cập thuộc tính `rotate`:

```js
const texts = document.querySelectorAll("text");

console.log(texts[0].rotate.baseVal); // output: 45
console.log(texts[1].rotate.baseVal); // output: 90
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGAnimatedNumberList")}}
