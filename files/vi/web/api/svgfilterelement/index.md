---
title: SVGFilterElement
slug: Web/API/SVGFilterElement
page-type: web-api-interface
browser-compat: api.SVGFilterElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFilterElement`** cung cấp quyền truy cập vào các thuộc tính của phần tử {{SVGElement("filter")}}, cũng như các phương thức để thao tác chúng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("SVGFilterElement.href")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("filter")}} đã cho.
- {{domxref("SVGFilterElement.filterUnits")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("filterUnits")}} của phần tử {{SVGElement("filter")}} đã cho. Nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.
- {{domxref("SVGFilterElement.primitiveUnits")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("primitiveUnits")}} của phần tử {{SVGElement("filter")}} đã cho. Nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.
- {{domxref("SVGFilterElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("filter")}} đã cho.
- {{domxref("SVGFilterElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("filter")}} đã cho.
- {{domxref("SVGFilterElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("filter")}} đã cho.
- {{domxref("SVGFilterElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("filter")}} đã cho.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("filter")}}
