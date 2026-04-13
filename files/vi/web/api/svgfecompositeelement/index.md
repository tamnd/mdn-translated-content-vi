---
title: SVGFECompositeElement
slug: Web/API/SVGFECompositeElement
page-type: web-api-interface
browser-compat: api.SVGFECompositeElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFECompositeElement`** tương ứng với phần tử {{SVGElement("feComposite")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFECompositeElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.in1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.in2")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in2")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.operator")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("operator")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.k1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("k1")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.k2")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("k2")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.k3")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("k3")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.k4")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("k4")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.type")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("type")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_FECOMPOSITE_OPERATOR_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFECompositeElement.values")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumberList")}} tương ứng với thuộc tính {{SVGAttr("values")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFECompositeElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức riêng nào, nhưng triển khai các phương thức của giao diện cha, {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_FECOMPOSITE_OPERATOR_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được xác định trước. Việc cố gắng định nghĩa một giá trị mới thuộc kiểu này hoặc chuyển một giá trị hiện có sang kiểu này là không hợp lệ.
- `SVG_FECOMPOSITE_OPERATOR_OVER` (1)
  - : Tương ứng với giá trị `over`.
- `SVG_FECOMPOSITE_OPERATOR_IN` (2)
  - : Tương ứng với giá trị `in`.
- `SVG_FECOMPOSITE_OPERATOR_OUT` (3)
  - : Tương ứng với giá trị `out`.
- `SVG_FECOMPOSITE_OPERATOR_ATOP` (4)
  - : Tương ứng với giá trị `atop`.
- `SVG_FECOMPOSITE_OPERATOR_XOR` (5)
  - : Tương ứng với giá trị `xor`.
- `SVG_FECOMPOSITE_OPERATOR_ARITHMETIC` (6)
  - : Tương ứng với giá trị `arithmetic`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feComposite")}}
