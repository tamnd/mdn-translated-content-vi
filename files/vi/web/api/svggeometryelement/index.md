---
title: SVGGeometryElement
slug: Web/API/SVGGeometryElement
page-type: web-api-interface
browser-compat: api.SVGGeometryElement
---

{{APIRef("SVG")}}

Giao diện `SVGGeometryElement` đại diện cho các phần tử SVG mà việc hiển thị của chúng được xác định bởi hình học với đường dẫn tương đương, và có thể được tô màu và viền. Điều này bao gồm các đường dẫn và các hình dạng cơ bản.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGGeometryElement.pathLength")}} {{ReadOnlyInline}}
  - : Thuộc tính này phản ánh thuộc tính {{SVGAttr("pathLength")}}.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ cha của nó, {{domxref("SVGGraphicsElement")}}._

- {{domxref("SVGGeometryElement.isPointInFill()")}}
  - : Xác định xem một điểm cho trước có nằm trong vùng tô màu của một phần tử hay không. Các quy tắc kiểm tra va chạm bình thường được áp dụng; giá trị của thuộc tính {{cssxref("pointer-events")}} trên phần tử xác định xem một điểm có được coi là nằm trong vùng tô màu hay không.
- {{domxref("SVGGeometryElement.isPointInStroke()")}}
  - : Xác định xem một điểm cho trước có nằm trong vùng viền của một phần tử hay không. Các quy tắc kiểm tra va chạm bình thường được áp dụng; giá trị của thuộc tính {{cssxref("pointer-events")}} trên phần tử xác định xem một điểm có được coi là nằm trong vùng viền hay không.
- {{domxref("SVGGeometryElement.getTotalLength()")}}
  - : Trả về giá trị tính toán của user agent cho tổng độ dài của đường dẫn trong đơn vị người dùng.
- {{domxref("SVGGeometryElement.getPointAtLength()")}}
  - : Trả về điểm tại một khoảng cách cho trước dọc theo đường dẫn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
