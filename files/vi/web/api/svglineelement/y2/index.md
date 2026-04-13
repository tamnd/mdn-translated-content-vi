---
title: "SVGLineElement: y2 property"
short-title: y2
slug: Web/API/SVGLineElement/y2
page-type: web-api-instance-property
browser-compat: api.SVGLineElement.y2
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y2`** của giao diện {{domxref("SVGLineElement")}} mô tả giá trị tọa độ trục y của điểm cuối của đường dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh thuộc tính hình học {{SVGAttr("y2")}} của phần tử {{SVGElement("line")}}.

Giá trị thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là vị trí cuối đó dọc theo trục y trong đơn vị hệ tọa độ người dùng.

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

Chúng ta có thể truy cập các giá trị tính toán của thuộc tính `y2`:

```js
const lines = document.querySelectorAll("line");
const y2Pos0 = lines[0].y2;
const y2Pos1 = lines[1].y2;
console.dir(y2Pos0.baseVal.value); // output: 50 (giá trị của `y2`)
console.dir(y2Pos1.baseVal.value); // output: 120 (60% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGLineElement.x2")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
