---
title: CSSUnparsedValue
slug: Web/API/CSSUnparsedValue
page-type: web-api-interface
browser-compat: api.CSSUnparsedValue
---

{{APIRef("CSS Typed OM")}}

Giao diện **`CSSUnparsedValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho các giá trị thuộc tính tham chiếu đến [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Guides/Cascading_variables). Nó bao gồm một danh sách các đoạn chuỗi và các tham chiếu biến.

Các thuộc tính tùy chỉnh được đại diện bởi `CSSUnparsedValue` và các tham chiếu {{cssxref("var", "var()")}} được đại diện bằng {{domxref('CSSVariableReferenceValue')}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("CSSUnparsedValue.CSSUnparsedValue", "CSSUnparsedValue()")}}
  - : Tạo một đối tượng `CSSUnparsedValue` mới.

## Thuộc tính phiên bản

- {{domxref('CSSUnparsedValue.length')}}
  - : Trả về số lượng mục trong đối tượng `CSSUnparsedValue`.

## Phương thức phiên bản

- {{domxref('CSSUnparsedValue.entries()')}}
  - : Trả về một mảng các cặp thuộc tính `[key, value]` của đối tượng theo cùng thứ tự như trong vòng lặp {{jsxref("Statements/for...in", "for...in")}}.
- {{domxref('CSSUnparsedValue.forEach()')}}
  - : Thực thi một hàm được cung cấp một lần cho mỗi phần tử của đối tượng `CSSUnparsedValue`.
- {{domxref('CSSUnparsedValue.keys()')}}
  - : Trả về một đối tượng _array iterator_ mới chứa các khóa cho mỗi chỉ mục trong đối tượng `CSSUnparsedValue`.
- {{domxref('CSSUnparsedValue.values()')}}
  - : Trả về một đối tượng _array iterator_ mới chứa các giá trị cho mỗi chỉ mục trong đối tượng `CSSUnparsedValue`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CSSImageValue')}}
- {{domxref('CSSKeywordValue')}}
- {{domxref('CSSNumericValue')}}
- {{domxref('CSSPositionValue')}}
- {{domxref('CSSTransformValue')}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
