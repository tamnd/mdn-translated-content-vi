---
title: "SVGTextPositioningElement: thuộc tính x"
short-title: x
slug: Web/API/SVGTextPositioningElement/x
page-type: web-api-instance-property
browser-compat: api.SVGTextPositioningElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGTextPositioningElement")}} mô tả tọa độ trục x của {{domxref("SVGTextElement")}} hoặc {{domxref("SVGTSpanElement")}} dưới dạng {{domxref("SVGAnimatedLengthList")}}. Nó phản ánh vị trí ngang của các ký tự văn bản riêng lẻ trong hệ tọa độ người dùng theo thuộc tính {{SVGAttr("x")}}.

Giá trị thuộc tính là danh sách các [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Các giá trị số trong {{domxref("SVGAnimatedLengthList.baseVal")}} phản ánh tọa độ x trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLengthList")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <text x="10" y="20">Hello</text>
  <text x="50" y="50">World</text>
</svg>
```

Chúng ta có thể truy cập các giá trị đã tính toán của thuộc tính `x`:

```js
const texts = document.querySelectorAll("text");

console.log(texts[0].x.baseVal[0].value); // output: 10
console.log(texts[1].x.baseVal[0].value); // output: 50
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTextPositioningElement.y")}}
- {{domxref("SVGAnimatedLengthList.baseVal")}}
