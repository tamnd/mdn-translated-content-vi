---
title: SVGScriptElement
slug: Web/API/SVGScriptElement
page-type: web-api-interface
browser-compat: api.SVGScriptElement
---

{{APIRef("SVG")}}

Giao diện **`SVGScriptElement`** tương ứng với phần tử SVG {{SVGElement("script")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("SVGScriptElement.href")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("script")}} đã cho.
- {{domxref("SVGScriptElement.type")}} {{ReadOnlyInline}}
  - : Một chuỗi tương ứng với thuộc tính {{SVGAttr("type")}} của phần tử {{SVGElement("script")}} đã cho. Một {{domxref("DOMException")}} sẽ được ném ra với mã `NO_MODIFICATION_ALLOWED_ERR` nếu cố gắng thay đổi giá trị của thuộc tính chỉ đọc.
- {{domxref("SVGScriptElement.crossOrigin")}} {{ReadOnlyInline}}
  - : Một chuỗi tương ứng với thuộc tính {{SVGAttr("crossorigin")}} của phần tử {{SVGElement("script")}} đã cho.

## Phương thức phiên bản

_Giao diện này không cài đặt bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ giao diện cha, {{domxref("SVGElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
