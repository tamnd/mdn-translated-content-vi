---
title: SVGGradientElement
slug: Web/API/SVGGradientElement
page-type: web-api-interface
browser-compat: api.SVGGradientElement
---

{{APIRef("SVG")}}

Giao diện **`SVGGradient`** là giao diện cơ sở được sử dụng bởi {{domxref("SVGLinearGradientElement")}} và {{domxref("SVGRadialGradientElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa thuộc tính từ đối tượng cha, {{domxref("SVGElement")}}._

- {{domxref("SVGGradientElement.href")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} của phần tử đã cho.
- {{domxref("SVGGradientElement.gradientUnits")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("gradientUnits")}} của phần tử đã cho. Thuộc tính này nhận một trong các hằng số được định nghĩa trong {{domxref("SVGUnitTypes")}}.
- {{domxref("SVGGradientElement.gradientTransform")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedTransformList")}} tương ứng với thuộc tính {{SVGAttr("gradientTransform")}} của phần tử đã cho.
- {{domxref("SVGGradientElement.spreadMethod")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} tương ứng với thuộc tính {{SVGAttr("spreadMethod")}} của phần tử đã cho. Một trong các kiểu phương thức trải được định nghĩa trên giao diện này.

## Phương thức phiên bản

_Giao diện này không cung cấp phương thức cụ thể nào, nhưng triển khai những phương thức của đối tượng cha, {{domxref("SVGElement")}}._

## Thuộc tính tĩnh

- `SVG_SPREADMETHOD_UNKNOWN` (0)
  - : Kiểu không phải là một trong các kiểu được định nghĩa sẵn. Không hợp lệ khi cố gắng định nghĩa một giá trị mới của kiểu này hoặc cố gắng chuyển đổi một giá trị hiện có sang kiểu này.
- `SVG_SPREADMETHOD_PAD` (1)
  - : Tương ứng với giá trị `pad`.
- `SVG_SPREADMETHOD_REFLECT` (2)
  - : Tương ứng với giá trị `reflect`.
- `SVG_SPREADMETHOD_REPEAT` (3)
  - : Tương ứng với giá trị `repeat`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
