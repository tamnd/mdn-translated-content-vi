---
title: SVGMaskElement
slug: Web/API/SVGMaskElement
page-type: web-api-interface
browser-compat: api.SVGMaskElement
---

{{APIRef("SVG")}}

Giao diện **`SVGMaskElement`** cung cấp quyền truy cập vào các thuộc tính của phần tử {{SVGElement("mask")}}, cũng như các phương thức để thao tác chúng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("SVGElement")}}._

- {{domxref("SVGMaskElement.maskUnits")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("maskUnits")}} của phần tử {{SVGElement("mask")}} đã cho. Nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.
- {{domxref("SVGMaskElement.maskContentUnits")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("maskContentUnits")}} của phần tử {{SVGElement("mask")}} đã cho. Nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.
- {{domxref("SVGMaskElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("mask")}} đã cho.
- {{domxref("SVGMaskElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("mask")}} đã cho.
- {{domxref("SVGMaskElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("mask")}} đã cho.
- {{domxref("SVGMaskElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("mask")}} đã cho.

## Phương thức phiên bản

_Giao diện này không cài đặt bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ giao diện cha {{domxref("SVGElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("mask")}}
