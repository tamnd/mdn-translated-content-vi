---
title: CSSGroupingRule
slug: Web/API/CSSGroupingRule
page-type: web-api-interface
browser-compat: api.CSSGroupingRule
---

{{ APIRef("CSSOM") }}

Giao diện **`CSSGroupingRule`** của [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho bất kỳ [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) CSS nào chứa các quy tắc khác được lồng bên trong.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("CSSRule")}}._

- {{domxref("CSSGroupingRule.cssRules")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("CSSRuleList")}} của các quy tắc CSS trong quy tắc media.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{domxref("CSSRule")}}._

- {{domxref("CSSGroupingRule.deleteRule")}}
  - : Xóa một quy tắc khỏi bảng kiểu.
- {{domxref("CSSGroupingRule.insertRule")}}
  - : Chèn quy tắc kiểu mới vào bảng kiểu hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng thông tin tạo kiểu động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
