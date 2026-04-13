---
title: "CSSStyleSheet: cssRules property"
short-title: cssRules
slug: Web/API/CSSStyleSheet/cssRules
page-type: web-api-instance-property
browser-compat: api.CSSStyleSheet.cssRules
---

{{APIRef("CSSOM")}}

Thuộc tính **`cssRules`** chỉ đọc của {{domxref("CSSStyleSheet")}} trả về một {{domxref("CSSRuleList")}} trực tiếp cung cấp danh sách cập nhật theo thời gian thực của mọi quy tắc CSS cấu thành bảng kiểu. Mỗi mục trong danh sách là một {{domxref("CSSRule")}} định nghĩa một quy tắc duy nhất.

## Giá trị

Một {{domxref("CSSRuleList")}} cập nhật trực tiếp chứa mỗi quy tắc CSS cấu thành bảng kiểu. Mỗi mục trong danh sách quy tắc là một đối tượng {{domxref("CSSRule")}} mô tả một quy tắc cấu thành bảng kiểu.

## Ví dụ

Có thể truy cập các quy tắc riêng lẻ trong bảng kiểu bằng chỉ số:

```js
const ruleList = document.styleSheets[0].cssRules;

for (let i = 0; i < ruleList.length; i++) {
  processRule(ruleList[i]);
}
```

Cũng có thể truy cập các quy tắc bằng {{jsxref("Statements/for...of", "for...of")}}:

```js
const ruleList = document.styleSheets[0].cssRules;

for (const rule of ruleList) {
  processRule(rule);
}
```

Tuy nhiên, vì `CSSRule` không phải là một mảng thực sự, bạn không thể sử dụng {{jsxref("Array.forEach", "forEach()")}}.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model)
- [Using dynamic styling information](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
