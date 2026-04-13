---
title: "SVGLineElement: y1 property"
short-title: y1
slug: Web/API/SVGLineElement/y1
page-type: web-api-instance-property
browser-compat: api.SVGLineElement.y1
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y1`** của giao diện {{domxref("SVGLineElement")}} mô tả điểm bắt đầu của đường SVG dọc theo trục y dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh thuộc tính hình học {{SVGAttr("y1")}} của phần tử {{SVGElement("line")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là vị trí bắt đầu đó dưới dạng độ dài dọc theo trục y trong đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 300 200" xmlns="http://www.w3.org/2000/svg">
  <line x1="20" y1="30" x2="40" y2="50" stroke="blue" stroke-width="2" />
  <line x1="15%" y1="5%" x2="30%" y2="60%" stroke="red" stroke-width="4" />
</svg>
```

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `y1`:

```js
const lines = document.querySelectorAll("line");
const y1Pos0 = lines[0].y1;
const y1Pos1 = lines[1].y1;
console.dir(y1Pos0.baseVal.value); // output: 30 (giá trị của `y1`)
console.dir(y1Pos1.baseVal.value); // output: 10 (5% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGLineElement.y2")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
