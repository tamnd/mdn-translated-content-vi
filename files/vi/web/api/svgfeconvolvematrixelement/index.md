---
title: SVGFEConvolveMatrixElement
slug: Web/API/SVGFEConvolveMatrixElement
page-type: web-api-interface
browser-compat: api.SVGFEConvolveMatrixElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFEConvolveMatrixElement`** tương ứng với phần tử {{SVGElement("feConvolveMatrix")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFEConvolveMatrixElement.bias")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("bias")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.divisor")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("divisor")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.edgeMode")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("edgeMode")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_EDGEMODE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFEConvolveMatrixElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.in1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.kernelMatrix")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumberList")}} tương ứng với thuộc tính {{SVGAttr("kernelMatrix")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.kernelUnitLengthX")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("kernelUnitLength")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.kernelUnitLengthY")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("kernelUnitLength")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.orderX")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedInteger")}} tương ứng với thuộc tính {{SVGAttr("order")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.orderY")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedInteger")}} tương ứng với thuộc tính {{SVGAttr("order")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.preserveAlpha")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedBoolean")}} tương ứng với thuộc tính {{SVGAttr("preserveAlpha")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.targetX")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedInteger")}} tương ứng với thuộc tính {{SVGAttr("targetX")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.targetY")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedInteger")}} tương ứng với thuộc tính {{SVGAttr("targetY")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFEConvolveMatrixElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức riêng nào, nhưng triển khai các phương thức của giao diện cha, {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_EDGEMODE_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được xác định trước. Việc cố gắng định nghĩa một giá trị mới thuộc kiểu này hoặc chuyển một giá trị hiện có sang kiểu này là không hợp lệ.
- `SVG_EDGEMODE_DUPLICATE` (1)
  - : Tương ứng với giá trị `duplicate`.
- `SVG_EDGEMODE_WRAP` (2)
  - : Tương ứng với giá trị `wrap`.
- `SVG_EDGEMODE_NONE` (3)
  - : Tương ứng với giá trị `none`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feConvolveMatrix")}}
