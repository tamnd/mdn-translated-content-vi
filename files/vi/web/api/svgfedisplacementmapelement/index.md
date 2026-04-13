---
title: SVGFEDisplacementMapElement
slug: Web/API/SVGFEDisplacementMapElement
page-type: web-api-interface
browser-compat: api.SVGFEDisplacementMapElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFEDisplacementMapElement`** tương ứng với phần tử {{SVGElement("feDisplacementMap")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFEDisplacementMapElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.in1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.in2")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in2")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.scale")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thuộc tính {{SVGAttr("scale")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.xChannelSelector")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("xChannelSelector")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_CHANNEL_*` được định nghĩa trên giao diện này.
- {{domxref("SVGFEDisplacementMapElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.
- {{domxref("SVGFEDisplacementMapElement.yChannelSelector")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("yChannelSelector")}} của phần tử đã cho. Nhận một trong các hằng số `SVG_CHANNEL_*` được định nghĩa trên giao diện này.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức riêng nào, nhưng triển khai các phương thức của giao diện cha, {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_CHANNEL_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được xác định trước. Việc cố gắng định nghĩa một giá trị mới thuộc kiểu này hoặc chuyển một giá trị hiện có sang kiểu này là không hợp lệ.
- `SVG_CHANNEL_R` (1)
  - : Tương ứng với giá trị `R`.
- `SVG_CHANNEL_G` (2)
  - : Tương ứng với giá trị `G`.
- `SVG_CHANNEL_B` (3)
  - : Tương ứng với giá trị `B`.
- `SVG_CHANNEL_A` (4)
  - : Tương ứng với giá trị `A`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feDisplacementMap")}}
