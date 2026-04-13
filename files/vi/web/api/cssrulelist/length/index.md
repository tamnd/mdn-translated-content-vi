---
title: "CSSRuleList: thuộc tính length"
short-title: length
slug: Web/API/CSSRuleList/length
page-type: web-api-instance-property
browser-compat: api.CSSRuleList.length
---

{{ APIRef("CSSOM") }}

Thuộc tính **`length`** của giao diện {{domxref("CSSRuleList")}} trả về số lượng đối tượng {{domxref("CSSRule")}} trong danh sách.

## Giá trị

Một số nguyên.

## Ví dụ

Trong ví dụ sau, số lượng mục trong {{domxref("CSSRuleList")}} tên `myRules` được in ra console.

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules.length);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
