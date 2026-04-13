---
title: CSSNamespaceRule
slug: Web/API/CSSNamespaceRule
page-type: web-api-interface
browser-compat: api.CSSNamespaceRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSNamespaceRule`** mô tả một đối tượng biểu thị một quy tắc CSS {{ cssxref("@namespace") }} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) đơn lẻ.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ lớp tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSNamespaceRule.namespaceURI")}}
  - : Trả về một chuỗi chứa văn bản URI của không gian tên đã cho.
- {{domxref("CSSNamespaceRule.prefix")}}
  - : Trả về một chuỗi với tên tiền tố liên kết với không gian tên này. Nếu không có tiền tố như vậy, trả về chuỗi rỗng.

## Phương thức phiên bản

_Kế thừa phương thức từ lớp tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

Stylesheet bao gồm một không gian tên là quy tắc duy nhất. Do đó, {{domxref("CSSRule")}} đầu tiên được trả về sẽ là `CSSNamespaceRule`.

```css
@namespace url("http://www.w3.org/1999/xhtml");
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0]); // A CSSNamespaceRule
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
