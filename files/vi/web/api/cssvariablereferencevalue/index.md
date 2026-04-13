---
title: CSSVariableReferenceValue
slug: Web/API/CSSVariableReferenceValue
page-type: web-api-interface
browser-compat: api.CSSVariableReferenceValue
---

{{APIRef("CSSOM")}}

Giao diện **`CSSVariableReferenceValue`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model) cho phép bạn tạo tên tùy chỉnh cho giá trị CSS tích hợp. Chức năng đối tượng này đôi khi được gọi là "biến CSS" và phục vụ cùng mục đích với hàm {{cssxref("var", "var()")}}. Tên tùy chỉnh phải bắt đầu bằng hai dấu gạch ngang.

## Hàm khởi tạo

- {{domxref("CSSVariableReferenceValue.CSSVariableReferenceValue", "CSSVariableReferenceValue()")}}
  - : Tạo một đối tượng `CSSVariableReferenceValue` mới.

## Thuộc tính phiên bản

- {{domxref('CSSVariableReferenceValue.variable')}}
  - : Trả về tên tùy chỉnh được truyền vào hàm khởi tạo.
- {{domxref('CSSVariableReferenceValue.fallback')}} {{ReadOnlyInline}}
  - : Trả về giá trị CSS tích hợp cho tên tùy chỉnh.

## Phương thức phiên bản

Không có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
