---
title: CSSTransformValue
slug: Web/API/CSSTransformValue
page-type: web-api-interface
browser-compat: api.CSSTransformValue
---

{{APIRef("CSS Typed OM")}}

Giao diện **`CSSTransformValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho các giá trị `transform-list` được sử dụng bởi thuộc tính CSS {{CSSxref('transform')}}.

{{InheritanceDiagram}}

## Các giao diện dựa trên CSSTransformValue

Dưới đây là danh sách các giao diện dựa trên giao diện `CSSTransformValue`.

- {{domxref('CSSTranslate')}}
- {{domxref('CSSRotate')}}
- {{domxref('CSSScale')}}
- {{domxref('CSSSkew')}}
- {{domxref('CSSSkewX')}}
- {{domxref('CSSSkewY')}}
- {{domxref('CSSPerspective')}}
- {{domxref('CSSMatrixComponent')}}

## Hàm khởi tạo

- {{domxref("CSSTransformValue.CSSTransformValue", "CSSTransformValue()")}}
  - : Tạo một đối tượng `CSSTransformValue` mới.

## Thuộc tính phiên bản

- {{domxref("CSSTransformValue.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng thành phần biến đổi có trong `CSSTransformValue`.
- {{domxref("CSSTransformValue.is2D")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean cho biết phép biến đổi là 2D hay 3D.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp tổ tiên {{domxref('CSSStyleValue')}}._

- {{domxref("CSSTransformValue.toMatrix()")}}
  - : Trả về một đối tượng {{domxref('DOMMatrix')}} mới.
- {{domxref('CSSTransformValue.entries()')}}
  - : Trả về một mảng các cặp thuộc tính `[key, value]` có thể liệt kê của đối tượng đã cho theo cùng thứ tự như vòng lặp {{jsxref("Statements/for...in", "for...in")}} (điểm khác biệt là vòng lặp for-in cũng liệt kê các thuộc tính trong chuỗi prototype).
- {{domxref('CSSTransformValue.forEach()')}}
  - : Thực thi một hàm được cung cấp một lần cho mỗi phần tử của đối tượng `CSSTransformValue`.
- {{domxref('CSSTransformValue.keys()')}}
  - : Trả về một đối tượng _array iterator_ mới chứa các khóa cho mỗi chỉ mục trong đối tượng `CSSTransformValue`.
- {{domxref('CSSTransformValue.values()')}}
  - : Trả về một đối tượng _array iterator_ mới chứa các giá trị cho mỗi chỉ mục trong đối tượng `CSSTransformValue`.

## Ví dụ

Sẽ bổ sung.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
