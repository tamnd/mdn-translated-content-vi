---
title: CSSNumericValue
slug: Web/API/CSSNumericValue
page-type: web-api-interface
browser-compat: api.CSSNumericValue
---

{{APIRef("CSS Typed OM")}}

Giao diện **`CSSNumericValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) đại diện cho các phép toán mà tất cả các giá trị số có thể thực hiện.

{{InheritanceDiagram}}

## Các giao diện dựa trên CSSNumericValue

Dưới đây là danh sách các giao diện dựa trên giao diện CSSNumericValue.

- {{domxref('CSSMathClamp')}}
- {{domxref('CSSMathInvert')}}
- {{domxref('CSSMathMax')}}
- {{domxref('CSSMathMin')}}
- {{domxref('CSSMathNegate')}}
- {{domxref('CSSMathProduct')}}
- {{domxref('CSSMathSum')}}
- {{domxref('CSSMathValue')}}
- {{domxref('CSSNumericArray')}}
- {{domxref('CSSUnitValue')}}

## Thuộc tính phiên bản

Không có.

## Phương thức tĩnh

- {{domxref('CSSNumericValue/parse_static', 'CSSNumericValue.parse')}}
  - : Cho phép tạo trực tiếp một `CSSNumericValue` từ một chuỗi chứa CSS.

## Phương thức phiên bản

- {{domxref('CSSNumericValue.add')}}
  - : Cộng thêm một số vào `CSSNumericValue`.
- {{domxref('CSSNumericValue.sub')}}
  - : Trừ một số khỏi `CSSNumericValue`.
- {{domxref('CSSNumericValue.mul')}}
  - : Nhân `CSSNumericValue` với giá trị được cung cấp.
- {{domxref('CSSNumericValue.div')}}
  - : Chia `CSSNumericValue` cho giá trị được cung cấp.
- {{domxref('CSSNumericValue.min')}}
  - : Trả về giá trị nhỏ nhất trong các giá trị được truyền vào.
- {{domxref('CSSNumericValue.max')}}
  - : Trả về giá trị lớn nhất trong các giá trị được truyền vào.
- {{domxref('CSSNumericValue.equals')}}
  - : _True_ nếu tất cả các giá trị có cùng kiểu và giá trị, theo cùng thứ tự. Nếu không, trả về _false._
- {{domxref('CSSNumericValue.to')}}
  - : Chuyển đổi `value` sang một đơn vị khác được chỉ định.
- {{domxref('CSSNumericValue.toSum')}}
  - : Chuyển đổi một `CSSNumericValue` hiện có thành đối tượng {{domxref("CSSMathSum")}} với các giá trị theo đơn vị được chỉ định.
- {{domxref('CSSNumericValue.type')}}
  - : Trả về kiểu của `CSSNumericValue`, một trong các giá trị: `angle`, `flex`, `frequency`, `length`, `resolution`, `percent`, `percentHint`, hoặc `time`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSImageValue')}}
- {{domxref('CSSKeywordValue')}}
- {{domxref('CSSPositionValue')}}
- {{domxref('CSSTransformValue')}}
- {{domxref('CSSUnparsedValue')}}
