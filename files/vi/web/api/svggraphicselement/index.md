---
title: SVGGraphicsElement
slug: Web/API/SVGGraphicsElement
page-type: web-api-interface
browser-compat: api.SVGGraphicsElement
---

{{APIRef("SVG")}}

Giao diện **`SVGGraphicsElement`** đại diện cho các phần tử SVG có mục đích chính là hiển thị đồ họa trực tiếp vào một nhóm.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("SVGElement")}}._

- {{domxref("SVGGraphicsElement.requiredExtensions")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGStringList")}} phản ánh thuộc tính {{SVGAttr("requiredExtensions")}} của phần tử đã cho.
- {{domxref("SVGGraphicsElement.systemLanguage")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGStringList")}} phản ánh thuộc tính {{SVGAttr("systemLanguage")}} của phần tử đã cho.
- {{domxref("SVGGraphicsElement.transform")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedTransformList")}} phản ánh giá trị tính toán của thuộc tính transform và thuộc tính {{SVGAttr("transform")}} tương ứng của phần tử đã cho.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha {{domxref("SVGElement")}}._

- {{domxref("SVGGraphicsElement.getBBox()")}}
  - : Trả về một {{domxref("DOMRect")}} đại diện cho hộp giới hạn tính toán của phần tử hiện tại.
- {{domxref("SVGGraphicsElement.getCTM()")}}
  - : Trả về một {{domxref("DOMMatrix")}} đại diện cho ma trận chuyển đổi hệ tọa độ của phần tử hiện tại sang hệ tọa độ viewport SVG của nó.
- {{domxref("SVGGraphicsElement.getScreenCTM()")}}
  - : Trả về một {{domxref("DOMMatrix")}} đại diện cho ma trận chuyển đổi hệ tọa độ của phần tử hiện tại sang hệ tọa độ của viewport SVG cho đoạn tài liệu SVG.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
