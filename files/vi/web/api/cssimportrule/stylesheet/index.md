---
title: "CSSImportRule: thuộc tính styleSheet"
short-title: styleSheet
slug: Web/API/CSSImportRule/styleSheet
page-type: web-api-instance-property
browser-compat: api.CSSImportRule.styleSheet
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`styleSheet`** của giao diện {{domxref("CSSImportRule")}} trả về Bảng kiểu CSS được chỉ định bởi [quy tắc điều kiện](/vi/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@import")}}. Đây sẽ là một đối tượng {{domxref("CSSStyleSheet")}}.

Một [quy tắc điều kiện](/vi/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@import")}} luôn có một bảng kiểu liên kết.

## Giá trị

Một {{domxref("CSSStyleSheet")}}.

## Ví dụ

Bảng kiểu sau đây bao gồm một quy tắc {{cssxref("@import")}} duy nhất. Do đó, mục đầu tiên trong danh sách các quy tắc CSS sẽ là một `CSSImportRule`. Thuộc tính `styleSheet` trả về bảng kiểu được nhập.

```css
@import "style.css" screen;
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].styleSheet); // Một CSSStyleSheet
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
