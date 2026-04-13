---
title: "CSSNamespaceRule: thuộc tính namespaceURI"
short-title: namespaceURI
slug: Web/API/CSSNamespaceRule/namespaceURI
page-type: web-api-instance-property
browser-compat: api.CSSNamespaceRule.namespaceURI
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`namespaceURI`** của giao diện {{domxref("CSSNamespaceRule")}} trả về một chuỗi chứa văn bản URI của không gian tên đã cho.

## Giá trị

Một chuỗi chứa URI.

## Ví dụ

Stylesheet bao gồm một không gian tên là quy tắc duy nhất. Do đó, {{domxref("CSSRule")}} đầu tiên được trả về sẽ là `CSSNamespaceRule`. Giá trị của thuộc tính `namespaceURI` sẽ là `http://www.w3.org/1999/xhtml`.

```css
@namespace url("http://www.w3.org/1999/xhtml");
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].namespaceURI); // 'http://www.w3.org/1999/xhtml'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
