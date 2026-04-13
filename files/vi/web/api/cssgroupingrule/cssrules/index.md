---
title: "CSSGroupingRule: cssRules property"
short-title: cssRules
slug: Web/API/CSSGroupingRule/cssRules
page-type: web-api-instance-property
browser-compat: api.CSSGroupingRule.cssRules
---

{{ APIRef("CSSOM") }}

Thuộc tính **`cssRules`** của giao diện
{{domxref("CSSGroupingRule")}} trả về {{domxref("CSSRuleList")}} chứa
một tập hợp các đối tượng {{domxref("CSSRule")}}.

## Giá trị

Một {{domxref("CSSRuleList")}}.

## Ví dụ

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
