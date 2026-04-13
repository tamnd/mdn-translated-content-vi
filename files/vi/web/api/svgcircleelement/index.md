---
title: SVGCircleElement
slug: Web/API/SVGCircleElement
page-type: web-api-interface
browser-compat: api.SVGCircleElement
---

{{APIRef("SVG")}}

Giao diện **`SVGCircleElement`** là giao diện cho phần tử {{SVGElement("circle")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("SVGGeometryElement")}}._

- {{domxref("SVGCircleElement.cx")}} {{ReadOnlyInline}}
  - : Thuộc tính này xác định tọa độ x của tâm của phần tử {{SVGElement("circle")}}. Nó được biểu thị bởi thuộc tính {{SVGAttr("cx")}} của phần tử.
- {{domxref("SVGCircleElement.cy")}} {{ReadOnlyInline}}
  - : Thuộc tính này xác định tọa độ y của tâm của phần tử `<circle>`. Nó được biểu thị bởi thuộc tính {{SVGAttr("cy")}} của phần tử.
- {{domxref("SVGCircleElement.r")}} {{ReadOnlyInline}}
  - : Thuộc tính này xác định bán kính của phần tử `<circle>`. Nó được biểu thị bởi thuộc tính {{SVGAttr("r")}} của phần tử.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha {{domxref("SVGGeometryElement")}}._

## Ví dụ

### Thay đổi kích thước hình tròn

Trong ví dụ này chúng ta vẽ một hình tròn và ngẫu nhiên tăng hoặc giảm bán kính của nó khi bạn nhấp vào nó.

#### HTML

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 250 250"
  width="250"
  height="250">
  <circle cx="100" cy="100" r="50" fill="gold" id="circle" />
</svg>
```

#### JavaScript

```js
const circle = document.getElementById("circle");

function clickCircle() {
  // Randomly determine if the circle radius will increase or decrease
  const change = Math.random() > 0.5 ? 10 : -10;
  // Clamp the circle radius to a minimum of 10 and a maximum of 250,
  // so it won't disappear or get bigger than the viewport
  const newValue = Math.min(Math.max(circle.r.baseVal.value + change, 10), 250);
  circle.setAttribute("r", newValue);
}

circle.addEventListener("click", clickCircle);
```

{{EmbedLiveSample('Resizing a circle', '', '300')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử SVG {{SVGElement("circle")}}
