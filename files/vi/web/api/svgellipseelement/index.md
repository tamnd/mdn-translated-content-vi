---
title: SVGEllipseElement
slug: Web/API/SVGEllipseElement
page-type: web-api-interface
browser-compat: api.SVGEllipseElement
---

{{APIRef("SVG")}}

Giao diện **`SVGEllipseElement`** cung cấp quyền truy cập vào các thuộc tính của phần tử {{SVGElement("ellipse")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa phương thức từ giao diện cha, {{domxref("SVGGeometryElement")}}._

- {{domxref("SVGEllipseElement.cx")}} {{ReadOnlyInline}}
  - : Thuộc tính này trả về một {{domxref("SVGAnimatedLength")}} phản ánh thuộc tính {{SVGAttr("cx")}} của phần tử {{SVGElement("ellipse")}} đã cho.
- {{domxref("SVGEllipseElement.cy")}} {{ReadOnlyInline}}
  - : Thuộc tính này trả về một {{domxref("SVGAnimatedLength")}} phản ánh thuộc tính {{SVGAttr("cy")}} của phần tử {{SVGElement("ellipse")}} đã cho.
- {{domxref("SVGEllipseElement.rx")}} {{ReadOnlyInline}}
  - : Thuộc tính này trả về một {{domxref("SVGAnimatedLength")}} phản ánh thuộc tính {{SVGAttr("rx")}} của phần tử {{SVGElement("ellipse")}} đã cho.
- {{domxref("SVGEllipseElement.ry")}} {{ReadOnlyInline}}
  - : Thuộc tính này trả về một {{domxref("SVGAnimatedLength")}} phản ánh thuộc tính {{SVGAttr("ry")}} của phần tử {{SVGElement("ellipse")}} đã cho.

## Phương thức phiên bản

_Kế thừa phương thức từ giao diện cha, {{domxref("SVGGeometryElement")}}._

## Ví dụ

### SVG

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <ellipse cx="100" cy="100" rx="100" ry="60" id="ellipse" />
</svg>
```

### JavaScript

```js
const ellipse = document.getElementById("ellipse");

function outputSize() {
  // Outputs "horizontal radius: 100 vertical radius: 60"
  console.log(
    `horizontal radius: ${ellipse.rx.baseVal.valueAsString}`,
    `vertical radius: ${ellipse.ry.baseVal.valueAsString}`,
  );
}

ellipse.addEventListener("click", outputSize);
```

### Kết quả

{{EmbedLiveSample("Example", 220, 220)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử SVG {{SVGElement("ellipse")}}
