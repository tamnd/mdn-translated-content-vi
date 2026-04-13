---
title: SVGMarkerElement
slug: Web/API/SVGMarkerElement
page-type: web-api-interface
browser-compat: api.SVGMarkerElement
---

{{APIRef("SVG")}}

Giao diện **`SVGMarkerElement`** cung cấp quyền truy cập vào các thuộc tính của phần tử {{SVGElement("marker")}}, cũng như các phương thức để thao tác chúng. Phần tử {{SVGElement("marker")}} xác định đồ họa dùng để vẽ các điểm đánh dấu trên một hình.

{{InheritanceDiagram}}

Tất cả các thuộc tính và phương thức sau đây đều trả về hoặc tác động lên các thuộc tính của phần tử {{SVGElement("marker")}} được biểu diễn bởi `SVGMarkerElement`.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("SVGElement")}}._

- {{domxref("SVGMarkerElement.markerUnits")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedEnumeration")}}, với một trong các giá trị sau:
    - 0
      - : `SVG_MARKERUNITS_UNKNOWN` nghĩa là thuộc tính {{SVGattr("markerUnits")}} có giá trị khác với hai từ khóa được xác định trước.
    - 1
      - : `SVG_MARKERUNITS_USERSPACEONUSE` nghĩa là thuộc tính {{SVGattr("markerUnits")}} có giá trị từ khóa `userSpaceOnUse`.
    - 2
      - : `SVG_MARKERUNITS_STROKEWIDTH` nghĩa là thuộc tính {{SVGattr("markerUnits")}} có giá trị từ khóa `strokeWidth`.

- {{domxref("SVGMarkerElement.markerWidth")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedLength")}} chứa chiều rộng của khung nhìn {{SVGElement("marker")}}.
- {{domxref("SVGMarkerElement.markerHeight")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedLength")}} chứa chiều cao của khung nhìn {{SVGElement("marker")}}.
- {{domxref("SVGMarkerElement.orientType")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedEnumeration")}}, với một trong các giá trị sau:
    - 0
      - : `SVG_MARKER_ORIENT_UNKNOWN` nghĩa là thuộc tính {{SVGattr("orient")}} có giá trị khác với hai từ khóa được xác định trước.
    - 1
      - : `SVG_MARKERUNITS_ORIENT_AUTO` nghĩa là thuộc tính {{SVGattr("orient")}} có giá trị từ khóa `auto`.
    - 2
      - : `SVG_MARKERUNITS_ORIENT_ANGLE` nghĩa là thuộc tính {{SVGattr("orient")}} có giá trị [`<angle>`](/en-US/docs/Web/SVG/Guides/Content_type#angle) hoặc [`<number>`](/en-US/docs/Web/SVG/Guides/Content_type#number) chỉ định góc xoay.

- {{domxref("SVGMarkerElement.orient")}}
  - : Một chuỗi xác định cách điểm đánh dấu được xoay khi đặt tại vị trí của nó trên hình. Nó phản ánh thuộc tính {{SVGAttr("orient")}} của phần tử {{SVGElement("marker")}}.
- {{domxref("SVGMarkerElement.orientAngle")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedAngle")}} chứa góc của thuộc tính {{SVGattr("orient")}}.
- {{domxref("SVGMarkerElement.refX")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedLength")}} chứa giá trị của thuộc tính {{SVGattr("refX")}} của phần tử {{SVGElement("marker")}}.
- {{domxref("SVGMarkerElement.refY")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedLength")}} chứa giá trị của thuộc tính {{SVGattr("refY")}} của phần tử {{SVGElement("marker")}}.
- {{domxref("SVGMarkerElement.viewBox")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGAnimatedRect")}} chứa một {{domxref("SVGRect")}} bao gồm các giá trị được đặt bởi thuộc tính {{SVGattr("viewBox")}} trên phần tử {{SVGElement("marker")}}.
- {{domxref("SVGMarkerElement.preserveAspectRatio")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("SVGPreserveAspectRatio")}} chứa các giá trị được đặt bởi thuộc tính {{SVGattr("preserveAspectRatio")}} trên khung nhìn phần tử {{SVGElement("marker")}}.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha, {{domxref("SVGElement")}}._

- {{domxref("SVGMarkerElement.setOrientToAuto()")}}
  - : Đặt giá trị của thuộc tính {{SVGattr("orient")}} thành `auto`.
- {{domxref("SVGMarkerElement.setOrientToAngle()")}}
  - : Đặt giá trị của thuộc tính {{SVGattr("orient")}} thành một giá trị góc cụ thể.

## Ví dụ

SVG sau sẽ được dùng trong các ví dụ.

```html
<svg id="svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker
      id="arrow"
      viewBox="0 0 10 10"
      refX="5"
      refY="5"
      markerWidth="6"
      markerHeight="6"
      orient="90">
      <path d="M 0 0 L 10 5 L 0 10 z" />
    </marker>
  </defs>
</svg>
```

### Tìm chiều rộng của điểm đánh dấu

Thuộc tính `markerWidth` trả về một {{domxref("SVGAnimatedLength")}} chứa một {{domxref("SVGLength")}} với giá trị của thuộc tính {{SVGattr("markerWidth")}}.

```js
let marker = document.getElementById("arrow");
console.log(marker.markerWidth.baseVal.value); // 6
```

### Cập nhật góc hướng

Trong ví dụ sau, giá trị của thuộc tính `orient` được cập nhật bằng `setOrientToAngle()` sử dụng một {{domxref("SVGAngle")}} được tạo bởi {{domxref("SVGSVGElement.createSVGAngle()")}}.

```js
let svg = document.getElementById("svg");
let marker = document.getElementById("arrow");
console.log(marker.orientAngle.baseVal.value); // value in SVG above - 90
let angle = svg.createSVGAngle();
angle.value = "110";
marker.setOrientToAngle(angle);
console.log(marker.orientAngle.baseVal.value); // new value - 110
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
