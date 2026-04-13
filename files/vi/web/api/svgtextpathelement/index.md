---
title: SVGTextPathElement
slug: Web/API/SVGTextPathElement
page-type: web-api-interface
browser-compat: api.SVGTextPathElement
---

{{APIRef("SVG")}}

Giao diện **`SVGTextPathElement`** tương ứng với phần tử {{SVGElement("textPath")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa thuộc tính từ giao diện cha, {{domxref("SVGTextContentElement")}}._

- {{domxref("SVGTextPathElement.href")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} của phần tử đã cho.
- {{domxref("SVGTextPathElement.startOffset")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thành phần X của thuộc tính {{SVGAttr("startOffset")}} của phần tử đã cho.
- {{domxref("SVGTextPathElement.method")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("method")}} của phần tử đã cho. Nó nhận một trong các hằng số `TEXTPATH_METHODTYPE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGTextPathElement.spacing")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("spacing")}} của phần tử đã cho. Nó nhận một trong các hằng số `TEXTPATH_SPACINGTYPE_*` được định nghĩa trên giao diện này.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức cụ thể nào, nhưng triển khai những phương thức của đối tượng cha, {{domxref("SVGTextContentElement")}}._

## Thuộc tính tĩnh

- `TEXTPATH_METHODTYPE_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được định nghĩa sẵn. Không hợp lệ khi cố gắng định nghĩa một giá trị mới của kiểu này hoặc cố gắng chuyển đổi một giá trị hiện có sang kiểu này.
- `TEXTPATH_METHODTYPE_ALIGN` (1)
  - : Tương ứng với giá trị `align`.
- `TEXTPATH_METHODTYPE_STRETCH` (2)
  - : Tương ứng với giá trị `stretch`.
- `TEXTPATH_SPACINGTYPE_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được định nghĩa sẵn. Không hợp lệ khi cố gắng định nghĩa một giá trị mới của kiểu này hoặc cố gắng chuyển đổi một giá trị hiện có sang kiểu này.
- `TEXTPATH_SPACINGTYPE_AUTO` (1)
  - : Tương ứng với giá trị `auto`.
- `TEXTPATH_SPACINGTYPE_EXACT` (2)
  - : Tương ứng với giá trị `exact`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("textPath")}}
