---
title: "CSSStyleSheet: ownerRule property"
short-title: ownerRule
slug: Web/API/CSSStyleSheet/ownerRule
page-type: web-api-instance-property
browser-compat: api.CSSStyleSheet.ownerRule
---

{{APIRef("CSSOM")}}

Thuộc tính **`ownerRule`** chỉ đọc của {{domxref("CSSStyleSheet")}} trả về {{domxref("CSSImportRule")}} tương ứng với {{cssxref("@import")}} at-rule đã nhập bảng kiểu vào tài liệu. Nếu bảng kiểu không được nhập vào tài liệu bằng cách sử dụng `@import`, giá trị trả về là `null`.

## Giá trị

Một {{domxref("CSSImportRule")}} tương ứng với {{cssxref("@import")}} rule đã nhập bảng kiểu vào tài liệu. Nếu bảng kiểu không được nhập vào tài liệu bằng cách sử dụng `@import`, giá trị trả về là `null`.

## Ví dụ

Đoạn mã này tìm kiếm các quy tắc không được nhập vào tài liệu bằng cách sử dụng một `@import` at-rule.

```js
const ruleList = document.styleSheets[0].cssRules;

for (const rule of ruleList) {
  if (!rule.ownerRule) {
    /* rule không được nhập */
  }
}
```

Đoạn mã này lấy tham chiếu đến bảng kiểu được liên kết với `@import` và xử lý nó theo cách nào đó:

```js
const ruleList = document.styleSheets[0].cssRules;

for (const rule of ruleList) {
  if (rule.ownerRule) {
    checkStylesheet(rule.ownerRule.styleSheet);
  }
}
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
