---
title: "CSSNamespaceRule: thuộc tính prefix"
short-title: prefix
slug: Web/API/CSSNamespaceRule/prefix
page-type: web-api-instance-property
browser-compat: api.CSSNamespaceRule.prefix
---

{{ APIRef("CSSOM") }}

Thuộc tính chỉ đọc **`prefix`** của giao diện {{domxref("CSSNamespaceRule")}} trả về một chuỗi với tên tiền tố liên kết với không gian tên này. Nếu không có tiền tố như vậy, nó trả về chuỗi rỗng.

## Giá trị

Một chuỗi chứa tiền tố liên kết với không gian tên này. Nếu không có tiền tố, là chuỗi rỗng.

## Ví dụ

Stylesheet bao gồm hai quy tắc không gian tên. Cái đầu tiên không có tiền tố, cái thứ hai có tiền tố `svg`. Hai đối tượng `CSSNamespaceRule` sẽ được trả về. Giá trị của thuộc tính `prefix` cho cái đầu tiên sẽ là chuỗi rỗng, cho cái thứ hai là `svg`.

```css
@namespace url("http://www.w3.org/1999/xhtml");
@namespace svg url("http://www.w3.org/2000/svg");
```

```js
let myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].prefix); // an empty string ""
console.log(myRules[1].prefix); // "svg"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
