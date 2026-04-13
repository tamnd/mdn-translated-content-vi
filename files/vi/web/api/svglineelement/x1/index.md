---
title: "SVGLineElement: x1 property"
short-title: x1
slug: Web/API/SVGLineElement/x1
page-type: web-api-instance-property
browser-compat: api.SVGLineElement.x1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x1`** của giao diện {{domxref("SVGLineElement")}} mô tả điểm bắt đầu của đường SVG dọc theo trục x dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh thuộc tính hình học {{SVGAttr("x1")}} của phần tử {{SVGElement("line")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là vị trí bắt đầu đó dưới dạng độ dài dọc theo trục x trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 300 200" xmlns="http://www.w3.org/2000/svg">
  <line x1="20" y1="30" x2="40" y2="50" stroke="blue" stroke-width="2" />
  <line x1="15%" y1="0" x2="30%" y2="60" stroke="red" stroke-width="4" />
</svg>
```

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `x1`:

```js
const lines = document.querySelectorAll("line");
const x1Pos0 = lines[0].x1;
const x1Pos1 = lines[1].x1;
console.dir(x1Pos0.baseVal.value); // output: 20 (giá trị của `x1`)
console.dir(x1Pos1.baseVal.value); // output: 45 (15% của 300)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGLineElement.x2")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
