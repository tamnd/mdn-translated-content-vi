---
title: SVGFEColorMatrixElement
slug: Web/API/SVGFEColorMatrixElement
page-type: web-api-interface
browser-compat: api.SVGFEColorMatrixElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFEColorMatrixElement`** tương ứng với phần tử {{SVGElement("feColorMatrix")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFEColorMatrixElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFEColorMatrixElement.in1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in")}} của phần tử đã cho.
- {{domxref("SVGFEColorMatrixElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFEColorMatrixElement.type")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("type")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_FECOLORMATRIX_TYPE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFEColorMatrixElement.values")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumberList")}} tương ứng với thuộc tính {{SVGAttr("values")}} của phần tử đã cho.
- {{domxref("SVGFEColorMatrixElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFEColorMatrixElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFEColorMatrixElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức cụ thể nào, nhưng triển khai các phương thức của giao diện cha, {{domxref("SVGElement")}}_.

## Thuộc tính tĩnh

- `SVG_FECOLORMATRIX_TYPE_UNKNOWN` (0)
  - : Kiểu không thuộc các kiểu được định nghĩa sẵn. Không hợp lệ khi cố gắng định nghĩa giá trị mới của kiểu này hoặc chuyển đổi giá trị hiện có sang kiểu này.
- `SVG_FECOLORMATRIX_TYPE_MATRIX` (1)
  - : Tương ứng với giá trị `matrix`.
- `SVG_FECOLORMATRIX_TYPE_SATURATE` (2)
  - : Tương ứng với giá trị `saturate`.
- `SVG_FECOLORMATRIX_TYPE_HUEROTATE` (3)
  - : Tương ứng với giá trị `hueRotate`.
- `SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA` (4)
  - : Tương ứng với giá trị `luminanceToAlpha`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feColorMatrix")}}
