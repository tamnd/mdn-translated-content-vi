---
title: SVGFEBlendElement
slug: Web/API/SVGFEBlendElement
page-type: web-api-interface
browser-compat: api.SVGFEBlendElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFEBlendElement`** tương ứng với phần tử {{SVGElement("feBlend")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFEBlendElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFEBlendElement.in1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in")}} của phần tử đã cho.
- {{domxref("SVGFEBlendElement.in2")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in2")}} của phần tử đã cho.
- {{domxref("SVGFEBlendElement.mode")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("mode")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_FEBLEND_MODE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFEBlendElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFEBlendElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFEBlendElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFEBlendElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức cụ thể nào, nhưng triển khai các phương thức của giao diện cha, {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_FEBLEND_MODE_UNKNOWN` (0)
  - : Kiểu không thuộc các kiểu được định nghĩa sẵn. Không hợp lệ khi cố gắng định nghĩa giá trị mới của kiểu này hoặc chuyển đổi giá trị hiện có sang kiểu này.
- `SVG_FEBLEND_MODE_NORMAL` (1)
  - : Tương ứng với giá trị `normal`.
- `SVG_FEBLEND_MODE_MULTIPLY` (2)
  - : Tương ứng với giá trị `multiply`.
- `SVG_FEBLEND_MODE_SCREEN` (3)
  - : Tương ứng với giá trị `screen`.
- `SVG_FEBLEND_MODE_DARKEN` (4)
  - : Tương ứng với giá trị `darken`.
- `SVG_FEBLEND_MODE_LIGHTEN` (5)
  - : Tương ứng với giá trị `lighten`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feBlend")}}
