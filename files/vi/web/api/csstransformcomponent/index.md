---
title: CSSTransformComponent
slug: Web/API/CSSTransformComponent
page-type: web-api-interface
browser-compat: api.CSSTransformComponent
---

{{APIRef("CSS Typed OM")}}

Giao diện **`CSSTransformComponent`** của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model) là một phần của giao diện {{domxref('CSSTransformValue')}}.

## Thuộc tính phiên bản

- {{domxref("CSSTransformComponent.is2D")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean cho biết transform là 2D hay 3D.

## Phương thức phiên bản

- {{domxref("CSSTransformComponent.toMatrix()")}}
  - : Trả về đối tượng {{domxref('DOMMatrix')}} mới.
- {{domxref("CSSTransformComponent.toString()")}}
  - : Chuỗi ở dạng [hàm transform](/en-US/docs/Web/CSS/Reference/Values/transform-function) CSS.

    Điều này sẽ sử dụng giá trị của `is2D` để trả về transform 2D hoặc 3D. Ví dụ nếu thành phần đại diện cho {{domxref("CSSRotate")}} và `is2D` là false thì chuỗi được trả về sẽ ở dạng hàm transform CSS {{cssxref("transform-function/rotate3d", "rotate3d()")}}. Nếu true thì chuỗi được trả về sẽ ở dạng hàm 2 chiều {{cssxref("transform-function/rotate", "rotate()")}}.

## Ví dụ

Đang cập nhật

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
