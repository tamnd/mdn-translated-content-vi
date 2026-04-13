---
title: SVGClipPathElement
slug: Web/API/SVGClipPathElement
page-type: web-api-interface
browser-compat: api.SVGClipPathElement
---

{{APIRef("SVG")}}

Giao diện **`SVGClipPathElement`** cung cấp quyền truy cập vào các thuộc tính của các phần tử {{SVGElement("clipPath")}}, cũng như các phương thức để thao tác với chúng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGClipPathElement.clipPathUnits")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("clipPathUnits")}} của phần tử {{SVGElement("clipPath")}} liên quan. Nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.
- {{domxref("SVGClipPathElement.transform")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("SVGAnimatedTransformList")}} tương ứng với thuộc tính {{SVGAttr("transform")}} của phần tử {{SVGElement("clipPath")}} liên quan.

## Phương thức phiên bản

_Giao diện này không cài đặt bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ cha của nó, {{domxref("SVGElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("clipPath")}}
- [Giới thiệu về CSS clipping](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
