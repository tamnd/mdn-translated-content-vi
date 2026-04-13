---
title: SVGRectElement
slug: Web/API/SVGRectElement
page-type: web-api-interface
browser-compat: api.SVGRectElement
---

{{APIRef("SVG")}}

Giao diện `SVGRectElement` cung cấp quyền truy cập vào các thuộc tính của phần tử {{SVGElement("rect")}}, cũng như các phương thức để thao tác chúng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("SVGGeometryElement")}}._

- {{domxref("SVGRectElement.x")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("rect")}} đã cho.
- {{domxref("SVGRectElement.y")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("rect")}} đã cho.
- {{domxref("SVGRectElement.width")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("rect")}} đã cho.
- {{domxref("SVGRectElement.height")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("rect")}} đã cho.
- {{domxref("SVGRectElement.rx")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("rx")}} của phần tử {{SVGElement("rect")}} đã cho.
- {{domxref("SVGRectElement.ry")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("ry")}} của phần tử {{SVGElement("rect")}} đã cho.

## Phương thức phiên bản

_Giao diện này không cài đặt bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ giao diện cha {{domxref("SVGGeometryElement")}}._

## Ví dụ

### Thay đổi màu sắc của một hình chữ nhật SVG

Ví dụ này đặt màu nền của một `SVGRectElement` thành một giá trị ngẫu nhiên mỗi khi người dùng nhấp vào nó.

#### HTML

```html
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect width="300" height="100" id="myrect" />
  <text x="60" y="40" fill="white" font-size="40">Click Me</text>
</svg>
```

#### CSS

```css
#myrect {
  fill: blue;
  stroke-width: 1;
  stroke: black;
}
```

#### JavaScript

```js
const myRect = document.querySelector("#myrect");

myRect.addEventListener("click", () => {
  const r = Math.floor(Math.random() * 255);
  const g = Math.floor(Math.random() * 255);
  const b = Math.floor(Math.random() * 255);
  myRect.style.fill = `rgb(${r} ${g} ${b})`;
});
```

#### Kết quả

{{EmbedLiveSample('Changing the color of an SVG rectangle')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("rect")}}
