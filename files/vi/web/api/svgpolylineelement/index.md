---
title: SVGPolylineElement
slug: Web/API/SVGPolylineElement
page-type: web-api-interface
browser-compat: api.SVGPolylineElement
---

{{APIRef("SVG")}}

Giao diện **`SVGPolylineElement`** cung cấp quyền truy cập vào các thuộc tính của các phần tử {{SVGElement("polyline")}}, cũng như các phương thức để thao tác với chúng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("SVGGeometryElement")}}._

- {{domxref("SVGPolylineElement.animatedPoints")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("SVGPointList")}} đại diện cho giá trị hoạt hình của thuộc tính {{SVGAttr("points")}} của phần tử. Nếu thuộc tính {{SVGAttr("points")}} không đang được hoạt hình, nó chứa giá trị tương tự như thuộc tính `points`.
- {{domxref("SVGPolylineElement.points")}}
  - : Một {{DOMxRef("SVGPointList")}} đại diện cho giá trị cơ sở (tức là tĩnh) của thuộc tính {{SVGAttr("points")}} của phần tử. Các thay đổi thông qua đối tượng {{DOMxRef("SVGPointList")}} được phản ánh trong thuộc tính {{SVGAttr("points")}} và ngược lại.

## Phương thức phiên bản

_Giao diện này không cài đặt bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ cha của nó, {{domxref("SVGGeometryElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("polyline")}}
