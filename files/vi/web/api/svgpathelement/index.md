---
title: SVGPathElement
slug: Web/API/SVGPathElement
page-type: web-api-interface
browser-compat: api.SVGPathElement
---

{{APIRef("SVG")}}

Giao diện **`SVGPathElement`** tương ứng với phần tử {{SVGElement("path")}}.

{{InheritanceDiagram}}

> [!NOTE]
> Trong SVG 2, các phương thức `getPathSegAtLength()` và `createSVGPathSeg*` đã bị loại bỏ, đồng thời thuộc tính `pathLength` cùng các phương thức `getTotalLength()` và `getPointAtLength()` đã được chuyển sang {{domxref("SVGGeometryElement")}}.

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ giao diện cha {{domxref("SVGGeometryElement")}}._

- {{domxref("SVGPathElement.pathLength")}} {{ReadOnlyInline}}
  - : Thuộc tính này phản ánh thuộc tính {{SVGAttr("pathLength")}}.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha {{domxref("SVGGeometryElement")}}._

- {{domxref("SVGPathElement.getPathData()")}} {{experimental_inline}}
  - : Trả về chuỗi các đoạn đường dẫn tương ứng với dữ liệu đường dẫn, tùy chọn chuẩn hóa các giá trị và loại đoạn.
- {{domxref("SVGPathElement.getPointAtLength()")}}
  - : Trả về điểm tại một khoảng cách nhất định dọc theo đường dẫn.
- {{domxref("SVGPathElement.getTotalLength()")}}
  - : Trả về giá trị tính toán của trình duyệt cho tổng độ dài của đường dẫn theo đơn vị người dùng.
- {{domxref("SVGPathElement.setPathData()")}} {{experimental_inline}}
  - : Đặt chuỗi các đoạn đường dẫn làm dữ liệu đường dẫn mới.
- {{domxref("SVGPathElement.getPathSegmentAtLength()")}} {{experimental_inline}}
  - : Trả về đoạn tại một khoảng cách nhất định dọc theo đường dẫn.

### Phương thức đã lỗi thời

- {{domxref("SVGPathElement.getPathSegAtLength()")}} {{deprecated_inline}}
  - : Trả về một số nguyên không dấu đại diện cho chỉ mục trong {{domxref("SVGAnimatedPathData.pathSegList", "pathSegList")}} sử dụng thuật toán tính khoảng cách dọc theo đường dẫn của trình duyệt.
- {{domxref("SVGPathElement.createSVGPathSegClosePath()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegClosePath")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegMovetoAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegMovetoAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegMovetoRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegMovetoRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegLinetoAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegLinetoAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegLinetoRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegLinetoRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoCubicAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoCubicAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoCubicRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoCubicRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoQuadraticAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoQuadraticAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoQuadraticRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoQuadraticRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegArcAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegArcAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegArcRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegArcRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegLinetoHorizontalAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegLinetoHorizontalAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegLinetoHorizontalRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegLinetoHorizontalRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegLinetoVerticalAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegLinetoVerticalAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegLinetoVerticalRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegLinetoVerticalRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoCubicSmoothAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoCubicSmoothAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoCubicSmoothRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoCubicSmoothRel")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoQuadraticSmoothAbs()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoQuadraticSmoothAbs")}} độc lập, không có cha.
- {{domxref("SVGPathElement.createSVGPathSegCurvetoQuadraticSmoothRel()")}} {{deprecated_inline}}
  - : Trả về một đối tượng {{domxref("SVGPathSegCurvetoQuadraticSmoothRel")}} độc lập, không có cha.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử SVG {{SVGElement("path")}}
