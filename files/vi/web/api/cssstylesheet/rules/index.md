---
title: "CSSStyleSheet: rules property"
short-title: rules
slug: Web/API/CSSStyleSheet/rules
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.CSSStyleSheet.rules
---

{{APIRef("CSSOM")}}{{deprecated_header}}

**`rules`** là một _thuộc tính legacy đã lỗi thời_ của giao diện {{domxref("CSSStyleSheet")}}. Có chức năng tương tự như thuộc tính {{domxref("CSSStyleSheet.cssRules", "cssRules")}} được khuyến nghị, nó cung cấp quyền truy cập vào danh sách cập nhật trực tiếp của các quy tắc CSS cấu thành bảng kiểu.

> [!NOTE]
> Là một thuộc tính legacy, bạn không nên sử dụng `rules` và thay vào đó nên sử dụng {{domxref("CSSStyleSheet.cssRules", "cssRules")}} được khuyến nghị.
> Mặc dù `rules` khó có thể bị xóa trong thời gian tới, nhưng khả năng hỗ trợ của nó không phổ biến rộng rãi và việc sử dụng nó sẽ dẫn đến các vấn đề tương thích cho trang web hoặc ứng dụng của bạn.

## Giá trị

Một {{domxref("CSSRuleList")}} cập nhật trực tiếp chứa mỗi quy tắc CSS cấu thành bảng kiểu. Mỗi mục trong danh sách quy tắc là một đối tượng {{domxref("CSSRule")}} mô tả một quy tắc cấu thành bảng kiểu.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
