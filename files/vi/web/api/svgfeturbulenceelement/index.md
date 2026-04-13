---
title: SVGFETurbulenceElement
slug: Web/API/SVGFETurbulenceElement
page-type: web-api-interface
browser-compat: api.SVGFETurbulenceElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFETurbulenceElement`** tương ứng với phần tử {{SVGElement("feTurbulence")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFETurbulenceElement.baseFrequencyX")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thành phần X của thuộc tính {{SVGAttr("baseFrequency")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.baseFrequencyY")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thành phần Y của thuộc tính {{SVGAttr("baseFrequency")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.numOctaves")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedInteger")}} tương ứng với thuộc tính {{SVGAttr("numOctaves")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.seed")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("seed")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.stitchTiles")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("stitchTiles")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_STITCHTYPE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFETurbulenceElement.type")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("type")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_TURBULENCE_TYPE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFETurbulenceElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFETurbulenceElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức riêng nào, nhưng triển khai các phương thức của giao diện cha, {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_TURBULENCE_TYPE_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được xác định trước. Việc cố gắng định nghĩa một giá trị mới thuộc kiểu này hoặc chuyển một giá trị hiện có sang kiểu này là không hợp lệ.
- `SVG_TURBULENCE_TYPE_FRACTALNOISE` (1)
  - : Tương ứng với giá trị `fractalNoise`.
- `SVG_TURBULENCE_TYPE_TURBULENCE` (2)
  - : Tương ứng với giá trị `turbulence`.
- `SVG_STITCHTYPE_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được xác định trước. Việc cố gắng định nghĩa một giá trị mới thuộc kiểu này hoặc chuyển một giá trị hiện có sang kiểu này là không hợp lệ.
- `SVG_STITCHTYPE_STITCH` (1)
  - : Tương ứng với giá trị `stitch`.
- `SVG_STITCHTYPE_NOSTITCH` (2)
  - : Tương ứng với giá trị `noStitch`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feTurbulence")}}
