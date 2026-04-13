---
title: SVGFEGaussianBlurElement
slug: Web/API/SVGFEGaussianBlurElement
page-type: web-api-interface
browser-compat: api.SVGFEGaussianBlurElement
---

{{APIRef("SVG")}}

Giao diện **`SVGFEGaussianBlurElement`** tương ứng với phần tử {{SVGElement("feGaussianBlur")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGFEGaussianBlurElement.edgeMode")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedEnumeration")}} xác định giá trị màu nào sẽ được sử dụng khi bộ lọc làm mờ cần lấy mẫu pixel vượt ra ngoài cạnh của ảnh đầu vào. Nó phản ánh thuộc tính {{SVGAttr("edgeMode")}} của phần tử {{SVGElement("feGaussianBlur")}} đã cho.
- {{domxref("SVGFEGaussianBlurElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử đã cho.
- {{domxref("SVGFEGaussianBlurElement.in1")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("in")}} của phần tử đã cho.
- {{domxref("SVGFEGaussianBlurElement.result")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("result")}} của phần tử đã cho.
- {{domxref("SVGFEGaussianBlurElement.stdDeviationX")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thành phần X (có thể được tính toán tự động) của thuộc tính {{SVGAttr("stdDeviation")}} của phần tử đã cho.
- {{domxref("SVGFEGaussianBlurElement.stdDeviationY")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedNumber")}} tương ứng với thành phần Y (có thể được tính toán tự động) của thuộc tính {{SVGAttr("stdDeviation")}} của phần tử đã cho.
- {{domxref("SVGFEGaussianBlurElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử đã cho.
- {{domxref("SVGFEGaussianBlurElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử đã cho.
- {{domxref("SVGFEGaussianBlurElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức của giao diện cha, {{domxref("SVGElement")}}._

- {{domxref("SVGFEGaussianBlurElement.setStdDeviation()")}}
  - : Đặt các giá trị cho thuộc tính `stdDeviation`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGElement("feGaussianBlur")}}
