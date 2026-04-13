---
title: "CSSFunctionDeclarations: thuộc tính style"
short-title: style
slug: Web/API/CSSFunctionDeclarations/style
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.CSSFunctionDeclarations.style
---

{{ APIRef("CSSOM") }}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("CSSFunctionDeclarations")}} chứa một đối tượng {{domxref("CSSFunctionDescriptors")}} đại diện cho các descriptor có sẵn trong phần thân at-rule {{cssxref("@function")}}.

## Giá trị

Một đối tượng {{domxref("CSSFunctionDescriptors")}}.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSFunctionDescriptors`, bạn vẫn có thể gán trực tiếp cho thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSFunctionDescriptors` bằng cách sử dụng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Ví dụ

Xem trang tham chiếu chính của {{domxref("CSSFunctionDeclarations")}} để biết các ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@function")}}
