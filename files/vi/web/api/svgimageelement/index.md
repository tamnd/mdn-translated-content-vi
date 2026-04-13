---
title: SVGImageElement
slug: Web/API/SVGImageElement
page-type: web-api-interface
browser-compat: api.SVGImageElement
---

{{APIRef("SVG")}}

Giao diện **`SVGImageElement`** tương ứng với phần tử {{SVGElement("image")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGImageElement.crossOrigin")}}
  - : Một chuỗi phản ánh thuộc tính nội dung {{SVGAttr("crossorigin")}}, đại diện cho cài đặt CORS của phần tử {{SVGElement("image")}} đã cho.
- {{domxref("SVGImageElement.decoding")}}
  - : Đại diện cho gợi ý được cung cấp cho trình duyệt về cách giải mã hình ảnh.
- {{domxref("SVGImageElement.height")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("image")}} đã cho.
- {{domxref("SVGImageElement.href")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedString")}} tương ứng với thuộc tính {{SVGAttr("href")}} hoặc {{SVGAttr("xlink:href")}} {{deprecated_inline}} của phần tử {{SVGElement("image")}} đã cho.
- {{domxref("SVGImageElement.preserveAspectRatio")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedPreserveAspectRatio")}} tương ứng với thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử {{SVGElement("image")}} đã cho.
- {{domxref("SVGImageElement.width")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("image")}} đã cho.
- {{domxref("SVGImageElement.x")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("image")}} đã cho.
- {{domxref("SVGImageElement.y")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGAnimatedLength")}} tương ứng với thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("image")}} đã cho.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGImageElement.decode()")}}
  - : Khởi tạo quá trình giải mã hình ảnh bất đồng bộ. Trả về một {{jsxref("Promise")}} được giải quyết khi dữ liệu hình ảnh sẵn sàng để sử dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
