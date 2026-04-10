---
title: "CSSImportRule: thuộc tính href"
short-title: href
slug: Web/API/CSSImportRule/href
page-type: web-api-instance-property
browser-compat: api.CSSImportRule.href
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`href`** của giao diện {{domxref("CSSImportRule")}} trả về URL được chỉ định bởi [quy tắc điều kiện](/vi/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@import")}}.

URL đã phân giải sẽ là thuộc tính [`href`](/vi/docs/Web/HTML/Reference/Elements/link#href) của bảng kiểu liên kết.

## Giá trị

Một chuỗi.

## Ví dụ

Bảng kiểu sau đây bao gồm một quy tắc {{cssxref("@import")}} duy nhất. Do đó, mục đầu tiên trong danh sách các quy tắc CSS sẽ là một `CSSImportRule`. Thuộc tính `href` trả về URL của bảng kiểu được nhập.

```css
@import "style.css" screen;
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].href); // 'style.css'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
