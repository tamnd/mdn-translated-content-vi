---
title: "CSSRule: parentStyleSheet property"
short-title: parentStyleSheet
slug: Web/API/CSSRule/parentStyleSheet
page-type: web-api-instance-property
browser-compat: api.CSSRule.parentStyleSheet
---

{{ APIRef("CSSOM") }}

Thuộc tính **`parentStyleSheet`** của interface {{domxref("CSSRule")}} trả về đối tượng {{domxref("StyleSheet")}} mà quy tắc hiện tại được định nghĩa trong đó.

## Giá trị

Một đối tượng {{domxref("StyleSheet")}}.

## Ví dụ

```js
const docRules = document.styleSheets[0].cssRules;
console.log(docRules[0].parentStyleSheet === document.styleSheets[0]); // trả về true
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
