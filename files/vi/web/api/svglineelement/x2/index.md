---
title: "SVGLineElement: x2 property"
short-title: x2
slug: Web/API/SVGLineElement/x2
page-type: web-api-instance-property
browser-compat: api.SVGLineElement.x2
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x2`** của giao diện {{domxref("SVGLineElement")}} mô tả giá trị tọa độ trục x của điểm cuối của đường dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh thuộc tính hình học {{SVGAttr("x2")}} của phần tử {{SVGElement("line")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là vị trí cuối đó dọc theo trục x trong đơn vị hệ tọa độ người dùng.

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

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `x2`:

```js
const lines = document.querySelectorAll("line");
const x2Pos0 = lines[0].x2;
const x2Pos1 = lines[1].x2;
console.dir(x2Pos0.baseVal.value); // output: 40 (giá trị của `x2`)
console.dir(x2Pos1.baseVal.value); // output: 90 (30% của 300)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGLineElement.y2")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
