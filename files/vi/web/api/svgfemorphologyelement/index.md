---
title: SVGFEMorphologyElement
slug: Web/API/SVGFEMorphologyElement
page-type: web-api-interface
browser-compat: api.SVGFEMorphologyElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFEMorphologyElement`** tương ứng với phần tử {{SVGElement("feMorphology")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFEMorphologyElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFEMorphologyElement.in1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in")}} của phần tử đã cho.
- {{domxref("SVGFEMorphologyElement.operator")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("operator")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_MORPHOLOGY_OPERATOR_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFEMorphologyElement.radiusX")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thành phần X của thuộc tính {{SVGAttr("radius")}} của phần tử đã cho.
- {{domxref("SVGFEMorphologyElement.radiusY")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thành phần Y của thuộc tính {{SVGAttr("radius")}} của phần tử đã cho.
- {{domxref("SVGFEMorphologyElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFEMorphologyElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFEMorphologyElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFEMorphologyElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức riêng nào, nhưng triển khai các phương thức của giao diện cha, {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_MORPHOLOGY_OPERATOR_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được xác định trước. Việc cố gắng định nghĩa một giá trị mới thuộc kiểu này hoặc chuyển một giá trị hiện có sang kiểu này là không hợp lệ.
- `SVG_MORPHOLOGY_OPERATOR_ERODE` (1)
  - : Tương ứng với giá trị `erode`.
- `SVG_MORPHOLOGY_OPERATOR_DILATE` (2)
  - : Tương ứng với giá trị `dilate`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feMorphology")}}
