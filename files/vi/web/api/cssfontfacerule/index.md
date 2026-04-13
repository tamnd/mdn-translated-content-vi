---
title: CSSFontFaceRule
slug: Web/API/CSSFontFaceRule
page-type: web-api-interface
browser-compat: api.CSSFontFaceRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSFontFaceRule`** đại diện cho một at-rule {{cssxref("@font-face")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ tổ tiên {{domxref("CSSRule")}}._

- {{domxref("CSSFontFaceRule.style")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("CSSFontFaceDescriptors")}} cho phép đọc và đặt các descriptor của at-rule {{cssxref("@font-face")}} liên quan.

## Phương thức phiên bản

_Kế thừa các phương thức từ tổ tiên {{domxref("CSSRule")}}._

## Ví dụ

Ví dụ này sử dụng CSS tìm thấy trong trang {{cssxref("@font-face")}}. {{domxref("CSSRule")}} đầu tiên được trả về sẽ là một `CSSFontFaceRule`.

```css
@font-face {
  font-family: "MyHelvetica";
  src:
    local("Helvetica Neue Bold"), local("HelveticaNeue-Bold"),
    url("MgOpenModernaBold.woff2");
  font-weight: bold;
}
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0]); // A CSSFontFaceRule
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
