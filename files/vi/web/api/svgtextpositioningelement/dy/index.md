---
title: "SVGTextPositioningElement: thuộc tính dy"
short-title: dy
slug: Web/API/SVGTextPositioningElement/dy
page-type: web-api-instance-property
browser-compat: api.SVGTextPositioningElement.dy
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`dy`** của giao diện {{domxref("SVGTextPositioningElement")}} mô tả tọa độ trục y của {{domxref("SVGTextElement")}} hoặc {{domxref("SVGTSpanElement")}} dưới dạng {{domxref("SVGAnimatedLengthList")}}. Nó phản ánh độ dịch chuyển dọc của các ký tự văn bản riêng lẻ trong hệ tọa độ người dùng theo thuộc tính {{SVGAttr("dy")}}.

Giá trị thuộc tính là danh sách các [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Các giá trị số trong {{domxref("SVGAnimatedLengthList.baseVal")}} phản ánh độ dịch chuyển dọc trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLengthList")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <text x="10" y="20" dy="5">Hello</text>
  <text x="50" y="50" dy="10">World</text>
</svg>
```

Chúng ta có thể truy cập các giá trị đã tính toán của thuộc tính `dy`:

```js
const texts = document.querySelectorAll("text");

console.log(texts[0].dy.baseVal[0].value); // output: 5
console.log(texts[1].dy.baseVal[0].value); // output: 10
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTextPositioningElement.dx")}}
- {{domxref("SVGAnimatedLengthList.baseVal")}}
