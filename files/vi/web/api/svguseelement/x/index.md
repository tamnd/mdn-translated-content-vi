---
title: "SVGUseElement: thuộc tính x"
short-title: x
slug: Web/API/SVGUseElement/x
page-type: web-api-instance-property
browser-compat: api.SVGUseElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGUseElement")}} mô tả tọa độ trục x của điểm bắt đầu của phần tử được tham chiếu dưới dạng {{domxref("SVGAnimatedLength")}}. Nó phản ánh giá trị đã tính toán của thuộc tính {{SVGAttr("x")}} trên phần tử {{SVGElement("use")}}.

Giá trị thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length), [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage), hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number). Giá trị số của {{domxref("SVGAnimatedLength.baseVal")}} là tọa độ x của góc trên bên trái của phần tử được tham chiếu trong hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

Cho SVG sau:

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <circle id="circle1" cx="50" cy="50" r="40" fill="blue" />
    <circle id="circle2" cx="50" cy="50" r="40" fill="red" />
  </defs>
  <use x="50%" y="50%" href="#circle1" />
  <use x="25%" y="50%" href="#circle2" />
</svg>
```

Chúng ta có thể truy cập các giá trị đã tính toán của thuộc tính `x`:

```js
const uses = document.querySelectorAll("use");
const xUse1 = uses[0].x;
const xUse2 = uses[1].x;

console.log(xUse1.baseVal.value); // output: 100 (50% của 200)
console.log(xUse2.baseVal.value); // output: 50 (25% của 200)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGUseElement.y")}}
- {{domxref("SVGAnimatedLength.baseVal")}}
