---
title: "CSSImportRule: thuộc tính supportsText"
short-title: supportsText
slug: Web/API/CSSImportRule/supportsText
page-type: web-api-instance-property
browser-compat: api.CSSImportRule.supportsText
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`supportsText`** của giao diện {{domxref("CSSImportRule")}} trả về điều kiện supports được chỉ định bởi [quy tắc điều kiện](/vi/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@import")}}.

## Giá trị

Một chuỗi, hoặc `null`.

## Ví dụ

Bảng kiểu duy nhất của tài liệu chứa ba quy tắc {{cssxref("@import")}}. Khai báo đầu tiên nhập một bảng kiểu nếu `display: flex` được hỗ trợ. Khai báo thứ hai nhập một bảng kiểu nếu bộ chọn `:has` được hỗ trợ. Khai báo thứ ba nhập một bảng kiểu mà không có điều kiện supports.

Thuộc tính `supportsText` trả về các điều kiện nhập liên kết với quy tắc điều kiện.

```css
@import "style1.css" supports(display: flex);
@import "style2.css" supports(selector(p:has(a)));
@import "style3.css";
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].supportsText); // trả về `"display: flex"`
console.log(myRules[1].supportsText); // trả về `"selector(p:has(a))"`
console.log(myRules[2].supportsText); // trả về `null`
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng truy vấn tính năng](/vi/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
- {{cssxref("@import")}} và {{cssxref("@supports")}}
